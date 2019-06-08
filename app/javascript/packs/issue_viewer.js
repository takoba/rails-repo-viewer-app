import Vue from 'vue/dist/vue.esm.js'
import IssueViewer from './components/IssueViewer.vue'

var app = new Vue({
  el: "#app",
  components: {
    'issueviewer': IssueViewer,
  },
});
