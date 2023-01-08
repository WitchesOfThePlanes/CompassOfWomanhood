<template>
  <div
    id="about"
    class="d-flex flex-column align-center justify-center py-10 about mx-6"
    :style="{ backgroundImage: `url(${bgImagePath})` }"
  >
    <div :class="smAndUp && 'page'">
      <h2 class="mt-16 mb-10">
        <SectionTitle data-aos="fade-up">
          <img class="sword" :src="swordPng" />
          {{ $t("ABOUT.TITLE") }}
        </SectionTitle>
      </h2>
      <div
        data-aos="fade-up"
        data-aos-delay="500"
        class="mt-2"
        v-for="(item, index) in $tm('ABOUT.MOD')"
        :key="index"
      >
        {{ $t(item) }}
      </div>
      <v-btn
        data-aos="fade-up"
        data-aos-delay="500"
        rounded="pill"
        color="secondary"
        variant="outlined"
        class="mt-16 text-lowercase font-weight-light"
      >
        <span class="d-flex align-baseline">
          <v-icon right class="mr-2"> fa:far fa-circle-play </v-icon>
          {{ $t("ABOUT.BUTTON") }}
        </span>
      </v-btn>
    </div>
  </div>
</template>

<script setup lang="ts">
import bgImagePath from "@/assets/section-bg.png";
import swordPng from "@/assets/Sword.png";

import { useDisplay } from "vuetify";
import SectionTitle from "@/components/SectionTitle.vue";

const { smAndUp } = useDisplay();
</script>

<style scoped>
.page {
  width: 60vw;
}
.about {
  min-height: 100vh;
  background-position: center center;
  background-size: contain;
}
.sword {
  margin-right: 16px;
  max-height: 2em;
}
</style>
