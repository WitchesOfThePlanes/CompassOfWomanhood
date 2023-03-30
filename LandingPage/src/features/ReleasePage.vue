<template>
  <div
    id="release"
    class="d-flex flex-column align-center justify-center py-10 mx-5"
  >
    <div :class="smAndUp && 'page'">
      <div data-aos="fade-up">
        <h2 class="mt-16 mb-10">
          <SectionTitle>
            <img class="sword" :src="swordPng" />
            {{ $t("RELEASE.TITLE") }}
          </SectionTitle>
        </h2>
        <InstallationContent />
        <h3 class="mt-2 mb-6">
          {{ $t("RELEASE.DOWNLOAD") }}
        </h3>
        <ReleaseCard :release="release" />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import swordPng from "@/assets/Sword.png";

import { useDisplay } from "vuetify";
import SectionTitle from "@/components/SectionTitle.vue";
import ReleaseCard from "@/components/ReleaseCard.vue";
import InstallationContent from "@/components/InstallationContent.vue";
import { Ref, UnwrapRef } from "vue";
import { Release } from "@/api/github/release.schema";
import { useLatestRelease } from "@/api/use-api.composable";

const release: Ref<UnwrapRef<Release | null>> = useLatestRelease();

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
