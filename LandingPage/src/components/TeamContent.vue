<template>
  <div class="external">
    <div v-html="content" />
  </div>
</template>

<script setup lang="ts">
import { useTeamContent } from "@/api/use-api.composable";

const content = useTeamContent();
</script>

<style lang="scss">
@import "external";
</style>
