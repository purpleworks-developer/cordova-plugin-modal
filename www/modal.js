var exec = require('cordova/exec');

var modal = {
  open: function(url) {
    exec(null,null,'Modal','open',[url]);
  },
  close: function(successCallback, errorCallback) {
    exec(successCallback, errorCallback, 'Modal', 'close',[]);
  }
}

module.exports = modal;
