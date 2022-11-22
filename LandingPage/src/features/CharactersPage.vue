<template>
  <div
    id="characters"
    class="d-flex flex-column align-center justify-center pa-10"
  >
    <h2 class="text-md-h4 ma-6 text-center">
      {{ $t("CHARACTERS.TITLE") }}
    </h2>
    <div class="text-center mb-10">
      {{ $t("CHARACTERS.INTRO") }}
    </div>
    <div :class="smAndUp && 'page'">
      <CharacterDetails character-name="SHITRI" layout="left" />
      <CharacterDetails character-name="CALY" layout="right" />
    </div>
  </div>
</template>

<script setup lang="ts">
import { useDisplay } from "vuetify";
import CharacterDetails from "@/components/CharacterDetails.vue";

const { smAndUp } = useDisplay();
</script>

<style scoped>
.page {
  width: 60vw;
}
</style>
