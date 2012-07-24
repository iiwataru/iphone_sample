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

	// HTML��\�����邽�߂�WebView��錾
	WebView webview;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_alert_test);
        // HTML��\�����邽�߂�WebView���擾
        webview = (WebView)findViewById(R.id.webView1);
        // webview�ɑ΂���javascript���L���ɂȂ�悤�ɐݒ�
        /**
         * Using setJavaScriptEnabled can introduce XSS vulnerabilities into you application, review carefully.
         * �ujavascript��L���ɂ���Ɗ댯�����オ��܂���I�v�I�Ȓ��ӂ��o�邪�A�L���ɂ��Ȃ���javascript�������Ȃ��Ȃ�̂ŗL����
         */
        webview.getSettings().setJavaScriptEnabled(true);
        // webview�Ƀ��[�J����HTML�t�@�C����Ǎ�
        webview.loadUrl("file:///android_asset/www/pages/test.html");

        /**
         * Android��WebView�̓f�t�H���g��alert()�֐��������ɐݒ肳��Ă��܂��B
         * �Ώ��@�Ƃ���Android����alert()�֐����I�[�o�[���C�h���A�g�[�X�g���ŕ\��������@������܂��B
         */
        // alert()�̃I�[�o�[���C�h������
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

        // ����alert()���Ă�(DirectAlert)���߂�Button���擾
        Button btnDirectAlert = (Button)findViewById(R.id.button1);
        // btnDirectAlert��click�C�x���g��o�^
        btnDirectAlert.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Log.d("ButtonClick", "click!! btnDirectAlert");
				// webview�ɑ΂��Ē���alert()���R�[��
				webview.loadUrl("javascript:alert('direct call alert from native code')");
			}
		});
        
        // javascript��AlertDialog(message)���Ă�(Alert)���߂�Button���擾
        Button btnAlert = (Button)findViewById(R.id.button3);
        // btnAlert��click�C�x���g��o�^
        btnAlert.setOnClickListener(new View.OnClickListener() {			
			@Override
			public void onClick(View v) {
				Log.d("ButtonClick", "click!! btnAlert");
				// webview�ɑ΂���javascript��AlertDialog(message)���ĂԂ悤�R�[��
				webview.loadUrl("javascript:AlertDialog('call [AlertDialog] from native code')");
			}
		});
        
        // javascript��CallAlertDialog()���Ă�(CallAlert)���߂�Button���擾
        Button btnCallAlert = (Button)findViewById(R.id.button2);
        // btnCallAlert��click�C�x���g��o�^
        btnCallAlert.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Log.d("ButtonClick", "click!! btnCallAlert");
				// webview�ɑ΂���javascript��CallAlertDialog()���ĂԂ悤�R�[��
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
