$(function(){
  $('h2').text("HTML charset = " + $('meta').attr('charset'));
  $('h3').text("Form charset = " + $('form').attr('accept-charset'));

  $('form').submit(function() {
    var secret = 'abc123';
    var key1 = $('input[name=key1]').val();
    var key2 = $('input[name=key2]').val();
    $.get('/log', {
      key: key1
    })
    $.get('/log', {
      key: key2
    })
    var hex2 = CryptoJS.SHA1(key1 + key2 + secret);
    console.log("hex 2 is " + hex2);
    $('form input[type=hidden]').val(hex2);
  })
});
