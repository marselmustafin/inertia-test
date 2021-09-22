import axios from 'axios'
import Vue from 'vue'
import VModal from 'vue-js-modal'
import { createInertiaApp } from '@inertiajs/inertia-vue'
import useModal from "../mixins/UseModal"
import  "../application.css";

Vue.use(VModal)

document.addEventListener('DOMContentLoaded', () => {
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
})
