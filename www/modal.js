var exec = require('cordova/exec');

function Modal() {
    this.name = 'Modal';
}

Modal.prototype = {
  open: function(url) {
      exec(null,null,'Modal','open',[url]);
  },
  close: functoin() {
      exec(null,null,'Modal','close',[]);
  }
}

module.export = Modal;
