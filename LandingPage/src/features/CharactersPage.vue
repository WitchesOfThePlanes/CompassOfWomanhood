<template>
  <div
    id="characters"
    class="d-flex flex-column align-center justify-center pa-10"
  >
    <h2 class="ma-6">
      <SectionTitle>
        <img class="sword" :src="swordPng" />
        {{ $t("CHARACTERS.TITLE") }}
      </SectionTitle>
    </h2>
    <div class="text-center mb-10">
      {{ $t("CHARACTERS.INTRO") }}
    </div>
    <div :class="smAndUp && 'page'">
      <CharacterDetails character-name="SHITHRI" layout="left" />
      <CharacterDetails character-name="CALY" layout="right" />
    </div>
  </div>
</template>

<script setup lang="ts">
import swordPng from "@/assets/Sword.png";

import { useDisplay } from "vuetify";
import CharacterDetails from "@/components/CharacterDetails.vue";
import SectionTitle from "@/components/SectionTitle.vue";

const { smAndUp } = useDisplay();
</script>

<style scoped>
.page {
  width: 60vw;
}
.sword {
  margin-right: 16px;
  max-height: 2em;
}
</style>
