<template>
  <div class="container">
    <div class="row">
      <div class="col s10 m11">
        <input class="form-control" placeholde="__USERNAME__/__REPONAME__">
      </div>
      <div class="col s2 m11">
        <div claas="btn-floating waves-effect waves-light red">
          <i class="material-icons">add</i>
        </div>
      </div>
    </div>
    <div>
      <ul class="collection">
        <li id="row_1" class="collection-item">
          <label for="row_1">username/reponame</label>
          <input type="button" id="row_1" value="delete">
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data() {
      return {
        issues: [],
      }
    },
    mounted: function() {
    },
    methods: {

    },
  }
</script>
