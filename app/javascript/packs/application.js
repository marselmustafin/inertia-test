import axios from 'axios'
import Vue from 'vue'
import { createInertiaApp } from '@inertiajs/inertia-vue'
import  "../application.css";

const csrfToken = document.querySelector('meta[name=csrf-token]').content
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

createInertiaApp({
  resolve: name => import(`../pages/${name}`),
  setup({ el, App, props }) {
    new Vue({
      render: h => h(App, props),
    }).$mount(el)
  },
})
