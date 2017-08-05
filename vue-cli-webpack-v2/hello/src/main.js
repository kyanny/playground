import Vue from 'vue'
import App from './App.vue'
import AppHello from './AppHello.vue'

Vue.component('app-hello', AppHello)

new Vue({
  el: '#app',
  render: h => h(App)
})
