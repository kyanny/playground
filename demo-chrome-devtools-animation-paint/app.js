var NavItem = Backbone.Model.extend({
  url: './data.json'
});

var NavView = Backbone.View.extend({
  template: _.template('<button type="button" class="btn btn-default" data-container="body" data-toggle="popover" data-placement="bottom" title="Popover title" data-content="Hello, world!">Click to toggle popover</button>'),
  initialize: function() {
//    this.listenTo(this.model, 'sync', 'showPopover');
  },
  render: function() {
    this.$el.html(this.template());
    this.$('[data-toggle="popover"]').popover();

    var that = this;
    this.model.fetch().done(function() {
      that.showPopover();
    });

    return this;
  },
  showPopover: function() {
    this.$el.find('button').click();
  }
});

$(function () {
  var navItem = new NavItem();
  var navView = new NavView({
    model: navItem
  });
  $('.navbar-header').append(navView.render().$el);
  $('.navbar-header button').click();

//  navItem.fetch();

  // $.get('./data.json', function() {
  //   $('.navbar-header button').click();
  // });
});
