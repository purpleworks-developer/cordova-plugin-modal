var exec = require('cordova/exec');

var modal = {
  open: function(url) {
    exec(null,null,'Modal','open',[url]);
  },
  close: function() {
    exec(null,null,'Modal','close',[]);
  }
}
// function Modal() {
//     this.name = 'Modal';
// }
//
// Modal.prototype = {
//   open: function(url) {
//       exec(null,null,'Modal','open',[url]);
//   },
//   close: functoin() {
//       exec(null,null,'Modal','close',[]);
//   }
// }
