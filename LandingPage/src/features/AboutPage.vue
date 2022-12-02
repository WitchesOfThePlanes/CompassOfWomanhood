<template>
  <div
    id="about"
    class="d-flex flex-column align-center justify-center pa-10 about"
  >
    <div :class="smAndUp && 'page'">
      <h2 class="mt-16 mb-10 mx-5">
        <SectionTitle>
          <SwordSvg />
          {{ $t("ABOUT.TITLE") }}
        </SectionTitle>
      </h2>
      <div
        class="mt-2 mx-5"
        v-for="(item, index) in $tm('ABOUT.MOD')"
        :key="index"
      >
        {{ $t(item) }}
      </div>
      <v-btn
        rounded="pill"
        color="secondary"
        variant="outlined"
        class="my-8 mx-5"
        @click="scrollTo('characters')"
      >
        {{ $t("ABOUT.BUTTON") }}
        <v-icon right class="ml-2"> mdi-arrow-down-thick </v-icon>
      </v-btn>
    </div>
  </div>
</template>

<script setup lang="ts">
import SwordSvg from "@/assets/Sword.svg";

import { useDisplay } from "vuetify";
import { useScrollTo } from "@/composables/scroll-to";
import SectionTitle from "@/components/SectionTitle.vue";

const { scrollTo } = useScrollTo();
const { smAndUp } = useDisplay();
</script>

<style scoped>
.page {
  width: 60vw;
}
.about {
  min-height: 100vh;
}
</style>
