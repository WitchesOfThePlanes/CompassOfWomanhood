<template>
  <v-app>
    <v-main>
      <HeroPage v-intersect="intersect('home')" />
      <div class="main">
        <IntroPage />
        <AboutPage v-intersect="intersect('about')" />
        <CharactersPage v-intersect="intersect('characters')" />
        <TeamPage v-intersect="intersect('team')" />
      </div>
    </v-main>
    <NavMenu :active-section="intersectedSection" v-if="smAndUp" />
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
import { ref } from "vue";
import IntroPage from "@/features/IntroPage.vue";
import TeamPage from "@/features/TeamPage.vue";

const { smAndUp } = useDisplay();

const intersectedSection = ref("");

const intersect = (name: string) => ({
  handler: onIntersect(name),
  options: {
    threshold: [0.1],
  },
});

const onIntersect = (name: string) => (isIntersecting: boolean) => {
  if (isIntersecting) {
    intersectedSection.value = name;
  }
};
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

html,
body {
  font-size: 14px;
}

a {
  color: #96c3ea;
  text-decoration: none;
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
