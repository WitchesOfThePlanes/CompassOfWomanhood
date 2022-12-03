<template>
  <div
    id="intro"
    class="d-flex flex-column align-center justify-center text-center py-10"
  >
    <h2 class="mt-16 mb-10 mx-md-0 mx-5 d-flex justify-center">
      <SectionTitle data-aos="fade-up" class="hashtag">
        <img class="hash" :src="hashPng" />
        {{ $t("INTRO.HASHTAG") }}
      </SectionTitle>
    </h2>
    <div
      data-aos="fade-up"
      data-aos-delay="500"
      class="px-10"
      :class="smAndUp && 'page'"
    >
      <div
        class="my-2 mx-5 introduction"
        v-for="(item, index) in $tm('INTRO.INTRODUCTION')"
        :key="index"
      >
        {{ $t(item) }}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import hashPng from "@/assets/Hash.png";

import SectionTitle from "@/components/SectionTitle.vue";
import { useDisplay } from "vuetify";

const { smAndUp } = useDisplay();
</script>

<style scoped>
.page {
  width: 60vw;
}

.hashtag {
  font-size: 1em;
  word-break: break-word;
  text-transform: lowercase;
}
.hash {
  max-height: 1.5em;
}

@media (min-width: 900px) {
  .hashtag {
    font-size: 3rem;
    line-height: 78px;
  }
}
</style>
