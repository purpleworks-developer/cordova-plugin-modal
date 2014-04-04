var exec = require('cordova/exec');

var modal = {
  open: function(successCallback, errorCallback, url) {
    exec(successCallback, errorCallback, 'Modal','open', [ url ]);
  },
  close: function(successCallback, errorCallback, jsonData) {
    exec(successCallback, errorCallback, 'Modal', 'close', [ jsonData ]);
  }
}

module.exports = modal;
