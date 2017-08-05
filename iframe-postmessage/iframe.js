window.addEventListener('load', function() {
  console.log('iframe load');
  window.addEventListener('message', function(e) {
    console.log('iframe message');
    console.log(e);
    var message = e.data;
    if (message === "setupPlayer") {
      parent.postMessage("setupComplete", "*");
    }
  });

  parent.postMessage("playerReady", "*");
});
