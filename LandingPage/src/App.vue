<template>
  <v-app>
    <v-main>
      <HeroPage />
    </v-main>
    <NavMenu />
  </v-app>
</template>

<script setup lang="ts">
import NavMenu from "@/components/NavMenu.vue";
import HeroPage from "@/features/HeroPage.vue";
</script>
