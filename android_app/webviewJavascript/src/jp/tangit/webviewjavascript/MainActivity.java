package jp.tangit.webviewjavascript;

import android.os.Bundle;
import android.app.Activity;
import android.util.Log;
import android.view.Menu;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends Activity {

	WebView webview;
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        webview = (WebView)findViewById(R.id.webView1);
        webview.getSettings().setJavaScriptEnabled(true);
        webview.setWebViewClient(new CustamWebView());
        webview.loadUrl("file:///android_asset/test.html");
        //Log.d("testtag", "testmassage");
        //webview.loadUrl("javascript:dispImage('hana_himawari.jpeg');");
        //webview.loadUrl("javascript:alert('sasa')");
        //Log.d("testtag", "testmassage2");
    }

    private class CustamWebView extends WebViewClient {
    	@Override
    	public void onPageFinished(WebView view, String url) {
    		view.loadUrl("javascript:dispAlert('call javascript')");
    	}
    }
    
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.activity_main, menu);
        return true;
    }
}
