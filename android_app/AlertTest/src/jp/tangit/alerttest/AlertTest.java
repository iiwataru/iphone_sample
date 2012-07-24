package jp.tangit.alerttest;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.Toast;

public class AlertTest extends Activity {

	// HTMLを表示するためのWebViewを宣言
	WebView webview;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_alert_test);
        // HTMLを表示するためのWebViewを取得
        webview = (WebView)findViewById(R.id.webView1);
        // webviewに対してjavascriptが有効になるように設定
        /**
         * Using setJavaScriptEnabled can introduce XSS vulnerabilities into you application, review carefully.
         * 「javascriptを有効にすると危険性が上がりますよ！」的な注意が出るが、有効にしないとjavascriptが動かなくなるので有効化
         */
        webview.getSettings().setJavaScriptEnabled(true);
        // webviewにローカルのHTMLファイルを読込
        webview.loadUrl("file:///android_asset/www/pages/test.html");

        /**
         * AndroidのWebViewはデフォルトでalert()関数が無効に設定されています。
         * 対処法としてAndroid側でalert()関数をオーバーライドし、トースト等で表示する方法があります。
         */
        // alert()のオーバーライドを実装
        webview.setWebChromeClient(new WebChromeClient() {
        	@Override
        	public boolean onJsAlert(WebView view,
        							String url,
        							String message,
        							JsResult result) {
        		Toast.makeText(getApplicationContext(), message, 3000).show();
        		result.confirm();
        		return true;
        	}
        });

        // 直接alert()を呼ぶ(DirectAlert)ためのButtonを取得
        Button btnDirectAlert = (Button)findViewById(R.id.button1);
        // btnDirectAlertのclickイベントを登録
        btnDirectAlert.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Log.d("ButtonClick", "click!! btnDirectAlert");
				// webviewに対して直接alert()をコール
				webview.loadUrl("javascript:alert('direct call alert from native code')");
			}
		});
        
        // javascriptのAlertDialog(message)を呼ぶ(Alert)ためのButtonを取得
        Button btnAlert = (Button)findViewById(R.id.button3);
        // btnAlertのclickイベントを登録
        btnAlert.setOnClickListener(new View.OnClickListener() {			
			@Override
			public void onClick(View v) {
				Log.d("ButtonClick", "click!! btnAlert");
				// webviewに対してjavascriptのAlertDialog(message)を呼ぶようコール
				webview.loadUrl("javascript:AlertDialog('call [AlertDialog] from native code')");
			}
		});
        
        // javascriptのCallAlertDialog()を呼ぶ(CallAlert)ためのButtonを取得
        Button btnCallAlert = (Button)findViewById(R.id.button2);
        // btnCallAlertのclickイベントを登録
        btnCallAlert.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Log.d("ButtonClick", "click!! btnCallAlert");
				// webviewに対してjavascriptのCallAlertDialog()を呼ぶようコール
				webview.loadUrl("javascript:CallAlertDialog()");
			}
		});
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_alert_test, menu);
        return true;
    }
}
