<template>
  <div class="external installation">
    <div v-html="content" />
  </div>
</template>

<script setup lang="ts">
import { useInstallationContent } from "@/api/use-api.composable";

const content = useInstallationContent();
</script>

<style lang="scss">
@import "external";
.installation {
  li {
    margin-top: 8px;
  }
}
</style>
