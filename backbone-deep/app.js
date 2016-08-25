$(function(){
  console.log('hello');

  var model = new Backbone.DeepModel({
  });

  function reset(model) {
    model.set('aya.colleges', [{
      'name': '東京大学'
    }, {
      'name': '早稲田大学'
    }, {
      'name': '慶応義塾大学'
    }]);
  }

  function dump(model) {
    console.log(_.clone(model.get('aya.colleges')));
  }

  reset(model);
  dump(model);

  model.unset('aya.colleges.1');
  dump(model);

  reset(model);
  model.deleteNested()
});
