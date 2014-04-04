package kr.co.purpleworks.cordova.modal;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Intent;

public class Modal extends CordovaPlugin {
	private static final int ACTIVITY_MODAL = 1001;							// modal activity request code
	public static final String PARAM_LOAD_URL = "loadUrl";					// passing data

	private CallbackContext callbackContext;

	@Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		this.callbackContext = callbackContext;
        if (action.equals("open")) {
            String url = args.getString(0);
            Intent intent = new Intent(this.cordova.getActivity(), ModalActivity.class);
            intent.putExtra(PARAM_LOAD_URL, url);
            this.cordova.getActivity().startActivityForResult(intent, ACTIVITY_MODAL);
            return true;
        } else if(action.equals("close")) {
        	if (cordova.getActivity() instanceof ModalActivity) {
        		JSONObject jsonObject = args.getJSONObject(0);
        		Intent intent = new Intent();
        		intent.putExtra("jsonString", jsonObject.toString());

        		this.cordova.getActivity().setResult(Activity.RESULT_OK);
        		this.cordova.getActivity().finish();
			} else {
				callbackContext.error("Illegal Argument Exception");
			}
        	return true;
        }
        return false;
    }

	public void onActivityResult(int requestCode, int resultCode, Intent intent) {
		if(requestCode == ACTIVITY_MODAL) {
			if(resultCode == Activity.RESULT_OK) {
				String jsonString = intent.getStringExtra("jsonString");
				JSONObject jsonObject = null;
				try {
					jsonObject = new JSONObject(jsonString);
					this.callbackContext.success(jsonObject);
				} catch (JSONException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
