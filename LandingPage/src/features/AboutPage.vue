<template>
  <div
    id="about"
    class="h-screen d-flex flex-column align-center justify-center text-center pa-10"
  >
    <div :class="smAndUp && 'page'">
      <h2 class="text-md-h4 mt-16 mb-10">
        {{ $t("ABOUT.TITLE") }}
      </h2>
      <div class="mt-2" v-for="(item, index) in $tm('ABOUT.MOD')" :key="index">
        {{ $t(item) }}
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
