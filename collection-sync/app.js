var RootView = Marionette.LayoutView.extend({
  el: 'body',
  template: _.template('<h1>Hello, world!</h1><div><div class="loading">Loading</div><div class="finished-loading hidden"></div></div>'),
  regions: function() {
    return {
      'mainRegion': '.finished-loading'
    };
  },
  collectionEvents: {
    'sync': 'render'
  },
  onRender: function() {
    if (this.collection.length) {
      this.mainRegion.show(new MyCollectionView({
        collection: this.collection
      }))
      this.$el('.loading, .finished-loading').toggleClass('hidden');
    }
  }
});

var MyItemView = Marionette.ItemView.extend({
  template: _.template('<p><%= name %></p>')
});

var MyCollectionView = Marionette.CollectionView.extend({
  childView: MyItemView
});

var MyItem = Backbone.Model.extend({
});

var MyCollection = Backbone.Collection.extend({
  model: MyItem
});

var App = new Marionette.Application();

App.on('start', function(options) {
  var collection = new MyCollection();
  this.rootView = new RootView({
    collection: collection
  });
  this.rootView.render();

  setTimeout(function() {
    console.log(collection);
    collection.add({
      name: "Kensuke"
    });
    collection.trigger('sync');
  }, 1000);
});

$(function(){
  App.start();
});
