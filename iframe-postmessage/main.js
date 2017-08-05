window.addEventListener('load', function() {
  var button = document.querySelector('#start');
  var x = 0;

  var listener = function(e) {
    console.log('main message ' + x);
    console.log(e);
    var message = e.data;
    if (message === "playerReady") {
      var _iframe = document.querySelector('iframe');
      _iframe.contentWindow.postMessage("setupPlayer", "*");
    } else if (message === "setupComplete") {
      console.log("onVideoReady");
    }
  };

  button.addEventListener('click', function() {
    x += 1;
    window.removeEventListener('message', listener);

    var _iframe = document.getElementsByTagName('iframe')[0];
    var _main = document.getElementById('main');
    if (_iframe) {
      _main.removeChild(_iframe);
    }

    window.addEventListener('message', listener)

    var main = document.getElementById('main');
    var iframe = document.createElement('iframe');
    iframe.setAttribute('src', "./iframe.html");

    var n = Math.random() * 10;
    console.log(n);
    console.log(['==> 1', document.querySelector('iframe')]);
    setTimeout(function() {
      console.log(['==> 2', document.querySelector('iframe')]);
      main.appendChild(iframe);
    }, n*1000);
  });
});
