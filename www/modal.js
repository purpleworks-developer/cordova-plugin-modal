var exec = require('cordova/exec');

var modal = {
  open: function(successCallback, errorCallback, url) {
    exec(successCallback, errorCallback, 'Modal','open', [ url ]);
  },
  close: function(successCallback, errorCallback, data) {
    exec(null, null, 'Modal', 'close', [ data ]);
  }
}

module.exports = modal;
