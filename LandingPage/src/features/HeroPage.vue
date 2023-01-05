<template>
  <div
    class="h-screen d-flex flex-column justify-center home"
    :style="{ backgroundImage: `url(${bgImagePath})` }"
  >
    <div class="w-50">
      <div class="d-flex align-center justify-center flex-row pa-6">
        <header
          data-aos="fade-up"
          class="headers d-flex flex-column align-center justify-center"
        >
          <h1 class="align-self-center font-weight-medium text-center">
            <img class="logo" :src="logoImagePath" alt="logo" />
          </h1>
          <h4 class="align-self-end text-right subtitle">
            {{ $t("HERO.SUBTITLE") }}
          </h4>
        </header>
      </div>
      <div
        class="d-flex align-center justify-center flex-column my-12 pa-6 coming-soon"
      >
        <h2 data-aos="fade-up" data-aos-delay="500">
          <SectionTitle>{{ $t("HERO.COMING_SOON") }}</SectionTitle>
        </h2>
        <v-btn
          data-aos="fade-up"
          data-aos-delay="1000"
          rounded="pill"
          color="secondary"
          variant="outlined"
          class="mx-8 mt-16 text-lowercase font-weight-light"
          @click="scrollTo('intro')"
        >
          <span class="d-flex align-center">
            {{ $t("HERO.BUTTON") }}
            <v-icon right class="ml-2"> mdi-arrow-down </v-icon>
          </span>
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import bgImagePath from "@/assets/home-bg.svg?url";
import logoImagePath from "@/assets/logo.png";

import { useScrollTo } from "@/utils/scroll-to.composable";
import SectionTitle from "@/components/SectionTitle.vue";

const { scrollTo } = useScrollTo();
</script>

<style scoped>
.home {
  background-color: #00000b;
  background-position: center right 100px;
  background-size: 60%;
}
.logo {
  max-width: 90vw;
}
.subtitle {
  font-size: 22px;
}
.coming-soon {
  position: relative;
  top: 150px;
}
</style>
