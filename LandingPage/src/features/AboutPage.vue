<template>
  <div
    id="about"
    class="h-screen d-flex flex-column align-center justify-center text-center pa-10"
  >
    <div :class="smAndUp && 'page'">
      <div class="font-italic mh-10 introduction">
        {{ $t("ABOUT.INTRODUCTION") }}
      </div>
      <h2 class="text-md-h4 mt-16">
        {{ $t("ABOUT.TITLE") }}
      </h2>
      <div class="mt-10">
        {{ $t("ABOUT.MOD") }}
      </div>
      <div class="mt-5">
        {{ $t("ABOUT.GOAL") }}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useDisplay } from "vuetify";

const { smAndUp } = useDisplay();
</script>

<style scoped>
.introduction {
  font-size: 0.8rem;
}
.page {
  width: 60vw;
}
</style>
