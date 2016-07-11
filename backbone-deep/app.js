$(function(){
  console.log('hello');

  var model = new Backbone.DeepModel({
  });

  model.set('aya.colleges', [{
    'name': '東京大学'
  }, {
    'name': '早稲田大学'
  }, {
    'name': '慶応義塾大学'
  }]);

  console.log(model);
  var old_aya_colleges = _.clone(model.get('aya.colleges'));
  console.log(old_aya_colleges);
  console.log(old_aya_colleges.length);

  model.unset('aya.colleges.1');

  var new_aya_colleges = _.clone(model.get('aya.colleges'));
  console.log(new_aya_colleges);
  console.log(new_aya_colleges.length);
});
