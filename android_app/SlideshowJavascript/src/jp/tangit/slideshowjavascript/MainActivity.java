package jp.tangit.slideshowjavascript;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends Activity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        WebView webview = (WebView)findViewById(R.id.webView1);
        webview.getSettings().setJavaScriptEnabled(true);
        webview.setWebViewClient(new onLoadWebView());
        webview.loadUrl("file:///android_asset/www/pages/test.html");
    }
    
    private class onLoadWebView extends WebViewClient {
    	/**
    	 * WebViewのロードが終わったイベントをオーバーライドする
    	 */
    	@Override
    	public void onPageFinished(WebView view, String url) {
    		// javascriptの関数を呼び出す
    		for (int cnt = 1; cnt < 6; cnt++) {
    			//view.loadUrl("javascript:addImages('file:///android_asset/www/img/umi" + String.valueOf(cnt) + ".jpeg')");
    			//view.loadUrl("javascript:addImages('../img/umi" + String.valueOf(cnt) + ".jpeg')");
    			view.loadUrl("javascript:addImages()");
    			Log.d("tagtag", "loop inin");
    		}
    		//view.loadUrl("javascript:document.getElementById('massage').innerHTML = 'testtesttest';");
    		Log.d("tagtag", "before play");
    		view.loadUrl("javascript:play()");
    		Log.d("tagtag", "play after");
    	}
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
