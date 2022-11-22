<template>
  <v-app>
    <v-main>
      <HeroPage />
      <AboutPage />
      <CharactersPage />
    </v-main>
    <NavMenu v-if="smAndUp" />
    <MobileNavMenu v-else />
    <AppFooter />
  </v-app>
</template>

<script setup lang="ts">
import { useDisplay } from "vuetify";
import NavMenu from "@/components/NavMenu.vue";
import MobileNavMenu from "@/components/MobileNavMenu.vue";
import HeroPage from "@/features/HeroPage.vue";
import AboutPage from "@/features/AboutPage.vue";
import CharactersPage from "@/features/CharactersPage.vue";
import AppFooter from "@/components/AppFooter.vue";

const { smAndUp } = useDisplay();
</script>
