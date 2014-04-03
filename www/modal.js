var exec = require('cordova/exec');

var modal = {
  open: function(successCallback, errorCallback, url) {
    exec(successCallback, errorCallback, 'Modal','open',[url]);
  },
  close: function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'Modal', 'close',[]);
  }
}

module.exports = modal;
