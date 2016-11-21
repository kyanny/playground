import Vue from 'vue'

Vue.component('my-feed', {
  props: ['feed', 'index', 'active'],
  template: `
    <h3 v-bind:class="{ 'active': active }"><a href="{{feed.href}}">{{feed.name}}</a></h3>
  `
})

new Vue({
  el: '#app',
  data: {
    feeds: [
      { name: 'はてなブログ開発ブログ', href: 'http://staff.hatenablog.com/' },
      { name: 'Quipper プロダクトチームのブログ', href: 'http://quipper.hatenablog.com/' },
      { name: 'Techcrunch Japan', href: '#' },
      { name: 'Gizmodo Japan', href: '#' },
      { name: "gigazine", href: '#' }
    ]
  },
  methods: {
    nextFeed () {
      var length = this.$children.length;
      var index = this.$children.findIndex(function(feed) { return feed.active })
      if ((index + 1) < length) {
        this.$children[index].active = false
        this.$children[index + 1].active = true
      }
    },
    prevFeed () {
      var length = this.$children.length;
      var index = this.$children.findIndex(function(feed) { return feed.active })
      if ((index - 1) > -1) {
        this.$children[index].active = false
        this.$children[index - 1].active = true
      }
    }
  },
  created () {
    window.addEventListener('keyup', e => {
      if (e.key === 's') {
        this.nextFeed(e)
      } else if (e.key === 'a') {
        this.prevFeed(e)
      }
    })
  },
  ready () {
    if (this.$children.length > 0) {
      this.$children[0].active = true
    }
  }
})
