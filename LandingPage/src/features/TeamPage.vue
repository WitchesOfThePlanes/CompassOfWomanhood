<template>
  <div
    id="team"
    class="d-flex flex-column align-center justify-center py-10 mx-5 team"
    :style="{ backgroundImage: `url(${bgImagePath})` }"
  >
    <div :class="smAndUp && 'page'">
      <div data-aos="fade-up">
        <h2 class="mt-16 mb-10">
          <SectionTitle>
            <img class="sword" :src="swordPng" />
            {{ $t("TEAM.TITLE") }}
          </SectionTitle>
        </h2>
        <TeamContent />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import bgImagePath from "@/assets/section-bg.png";
import swordPng from "@/assets/Sword.png";

import { useDisplay } from "vuetify";
import SectionTitle from "@/components/SectionTitle.vue";
import TeamContent from "@/components/TeamContent.vue";

const { smAndUp } = useDisplay();
</script>

<style scoped>
.page {
  width: 60vw;
}
.team {
  background-position: center center;
  background-size: contain;
}
.sword {
  margin-right: 16px;
  max-height: 2em;
}
</style>
