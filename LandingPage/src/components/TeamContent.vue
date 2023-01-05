<template>
  <div class="external">
    <div v-html="content" />
  </div>
</template>

<script setup lang="ts">
import { useTeamContent } from "../api/use-api.composable";

const content = useTeamContent();
</script>

<style lang="scss">
.external {
  margin: 0 24px;
  h2 {
    display: none;
  }
  ul {
    margin-top: 12px;
    margin-bottom: 24px;
  }
  li {
    margin-left: 24px;
  }
}
</style>
