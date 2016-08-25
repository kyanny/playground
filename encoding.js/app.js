window.onload = function() {
  

  $('form').on('submit', function(e) {
    if ($('input[name=name]').val() === '') {
      console.log('validation error');
      e.preventDefault();
      return;
    }
    
  });
};
