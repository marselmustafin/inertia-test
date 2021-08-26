import Vue from 'vue'
import { createInertiaApp } from '@inertiajs/inertia-vue'

document.addEventListener('DOMContentLoaded', () => {
  createInertiaApp({
    resolve: name => require(`../pages/${name}`),
    setup({ el, App, props }) {
      new Vue({
        render: h => h(App, props),
      }).$mount(el)
    },
  })
})
