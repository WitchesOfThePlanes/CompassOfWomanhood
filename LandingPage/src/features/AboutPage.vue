<template>
  <div
    id="about"
    class="h-screen d-flex flex-column align-center justify-center text-center pa-10"
  >
    <div :class="smAndUp && 'page'">
      <div class="font-italic my-10 introduction">
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
      <v-btn
        rounded="pill"
        color="secondary"
        variant="outlined"
        class="ma-8"
        @click="scrollTo('characters')"
      >
        {{ $t("ABOUT.BUTTON") }}
        <v-icon right class="ml-2"> mdi-arrow-down-thick </v-icon>
      </v-btn>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useDisplay } from "vuetify";
import { useScrollTo } from "@/composables/scroll-to";

const { scrollTo } = useScrollTo();
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
