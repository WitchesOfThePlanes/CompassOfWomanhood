<template>
  <v-app>
    <v-main>
      <HeroPage />
    </v-main>
    <NavMenu v-if="smAndUp" />
    <MobileNavMenu v-else>
      <template #menu>
        <NavMenu />
      </template>
    </MobileNavMenu>
  </v-app>
</template>

<script setup lang="ts">
import NavMenu from "@/components/NavMenu.vue";
import HeroPage from "@/features/HeroPage.vue";
import { useDisplay } from "vuetify";
import MobileNavMenu from "@/components/MobileNavMenu.vue";

const { smAndUp } = useDisplay();
</script>
