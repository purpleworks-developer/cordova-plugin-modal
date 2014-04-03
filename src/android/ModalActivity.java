package kr.co.purpleworks.cordova.modal;

import kr.co.purpleworks.plugin_dev.R;

import org.apache.cordova.CordovaActivity;

import android.os.Bundle;

public class ModalActivity extends CordovaActivity 
{
    @Override
    public void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        this.overridePendingTransition(R.anim.bottom_in, R.anim.hold);
        super.init();
        
        String url = getIntent().getStringExtra(Modal.PARAM_LOAD_URL);
        super.loadUrl(url);
    }
    
    @Override
    public void finish() {
    	super.finish();
    	this.overridePendingTransition(R.anim.hold, R.anim.bottom_out);
    }
}
