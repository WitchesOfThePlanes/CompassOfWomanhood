<template>
  <v-app>
    <v-main>
      <HeroPage />
      <div class="main">
        <AboutPage />
        <CharactersPage />
      </div>
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

<style>
html,
body,
h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Alexandria", serif;
  font-weight: 300;
}

.main {
  background: linear-gradient(
    180deg,
    #00000b 0%,
    #232337 31.25%,
    #3d394e 73.44%,
    #4c455c 100%
  );
}
</style>
