var exec = require('cordova/exec');

var modal = {
  open: function(url) {
    exec(null,null,'Modal','open',[url]);
  },
  close: function() {
    exec(null,null,'Modal','close',[]);
  }
}
