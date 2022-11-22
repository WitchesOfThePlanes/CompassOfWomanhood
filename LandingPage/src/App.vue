<template>
  <v-app>
    <v-main>
      <HeroPage />
      <AboutPage />
    </v-main>
    <NavMenu v-if="smAndUp" />
    <MobileNavMenu v-else />
  </v-app>
</template>

<script setup lang="ts">
import NavMenu from "@/components/NavMenu.vue";
import HeroPage from "@/features/HeroPage.vue";
import AboutPage from "@/features/AboutPage.vue";
import { useDisplay } from "vuetify";
import MobileNavMenu from "@/components/MobileNavMenu.vue";

const { smAndUp } = useDisplay();
</script>
