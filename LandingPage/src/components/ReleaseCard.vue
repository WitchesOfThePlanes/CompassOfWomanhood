<template>
  <div v-if="release">
    <v-card variant="outlined" max-width="600">
      <v-card-item>
        <v-card-title class="my-2">{{ release.name }}</v-card-title>
        <v-card-subtitle>
          <v-chip prepend-icon="mdi-tag" class="mx-2">
            {{ release.tag_name }}
          </v-chip>
          <v-chip prepend-icon="mdi-calendar">
            {{ release.published_at.toLocaleDateString() }}
          </v-chip>
        </v-card-subtitle>
      </v-card-item>

      <v-card-text>
        <div class="mt-3">
          <v-btn
            rounded="pill"
            color="secondary"
            variant="outlined"
            class="mr-4 text-lowercase font-weight-light"
            :href="release.html_url"
          >
            <span class="d-flex align-baseline">
              {{ $t("RELEASE.BUTTONS.GITHUB") }}
              <v-icon right class="ml-2"> fa:fab fa-github </v-icon>
            </span>
          </v-btn>
          <v-btn
            rounded="pill"
            color="secondary"
            variant="outlined"
            class="text-lowercase font-weight-light"
            @click="dialog = true"
          >
            <span class="d-flex align-baseline">
              {{ $t("RELEASE.BUTTONS.NOTES") }}
              <v-icon right class="ml-2"> fa:far fa-note-sticky </v-icon>
            </span>
          </v-btn>
        </div>
      </v-card-text>
      <v-card-actions>
        <v-btn :href="release.zipball_url">
          {{ $t("RELEASE.BUTTONS.ZIP") }}
        </v-btn>
        <v-btn :href="release.tarball_url">
          {{ $t("RELEASE.BUTTONS.TAR") }}
        </v-btn>
      </v-card-actions>
    </v-card>
    <v-dialog v-model="dialog" max-width="90vw" width="800">
      <v-card class="notes-dialog rounded-xl">
        <v-card-title>{{ $t("RELEASE.DIALOG.TITLE") }}</v-card-title>
        <v-card-text>
          <div class="external">
            <div v-html="release.body" />
          </div>
        </v-card-text>
        <v-card-actions class="d-flex justify-center">
          <v-btn
            rounded="pill"
            color="secondary"
            variant="outlined"
            class="mx-5 text-lowercase font-weight-light"
            @click="dialog = false"
          >
            {{ $t("RELEASE.DIALOG.CLOSE") }}</v-btn
          >
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script setup lang="ts">
import { useLatestRelease } from "@/api/use-api.composable";
import { Release } from "@/api/github/release.schema";
import { ref, Ref, UnwrapRef } from "vue";

const release: Ref<UnwrapRef<Release | null>> = useLatestRelease();
const dialog = ref(false);
</script>

<style lang="scss">
.notes-dialog {
  background: #14162a;
}
</style>
