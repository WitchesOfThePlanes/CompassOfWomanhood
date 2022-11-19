<template>
  <div class="h-screen d-flex flex-column justify-center">
    <div class="d-flex align-center justify-space-between flex-row pa-6">
      <div class="none" />
      <header class="headers d-flex flex-column align-center justify-center">
        <h1 class="text-h1 align-self-center font-weight-medium">
          {{ $t("HERO.TITLE") }}
        </h1>
        <h4 class="text-h4 align-self-end text-medium-emphasis">
          {{ $t("HERO.SUBTITLE") }}
        </h4>
      </header>
      <NavMenu />
    </div>
    <div class="d-flex align-center justify-center flex-column pa-6">
      <h2 class="text-h2 text-uppercase font-weight-bold">
        {{ $t("HERO.COMING_SOON") }}
      </h2>
      <v-btn
        rounded="pill"
        color="secondary"
        variant="outlined"
        class="ma-6"
        :href="ghLink"
      >
        {{ $t("HERO.BUTTON") }}
      </v-btn>
    </div>
  </div>
</template>

<script setup lang="ts">
import NavMenu from "@/components/NavMenu.vue";
const ghLink = "https://github.com/Udiknedormin/CompassOfWomanhood";
</script>

<style scoped></style>
