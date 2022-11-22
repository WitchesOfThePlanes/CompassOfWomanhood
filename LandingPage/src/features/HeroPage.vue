<template>
  <div class="h-screen d-flex flex-column justify-center">
    <div class="d-flex align-center justify-center flex-row pa-6">
      <header class="headers d-flex flex-column align-center justify-center">
        <h1 class="text-md-h2 align-self-center font-weight-medium text-center">
          {{ $t("HERO.TITLE") }}
        </h1>
        <h4 class="text-md-h5 align-self-end text-medium-emphasis text-right">
          {{ $t("HERO.SUBTITLE") }}
        </h4>
      </header>
    </div>
    <div class="d-flex align-center justify-center flex-column my-12 pa-6">
      <h2 class="text-md-h3 text-uppercase font-weight-bold">
        {{ $t("HERO.COMING_SOON") }}
      </h2>
      <v-btn
        rounded="pill"
        color="secondary"
        variant="outlined"
        class="ma-8"
        @click="scrollTo('about')"
      >
        {{ $t("HERO.BUTTON") }}
        <v-icon right class="ml-2"> mdi-arrow-down-thick </v-icon>
      </v-btn>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useScrollTo } from "@/composables/scroll-to";

const { scrollTo } = useScrollTo();
</script>

<style scoped></style>
