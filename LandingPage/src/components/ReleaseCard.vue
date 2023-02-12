<template>
  <div v-if="release">
    <v-card variant="outlined" max-width="90vw" width="600" class="rounded-xl">
      <v-card-item>
        <v-card-title class="my-2">{{ release.name }}</v-card-title>
        <v-card-subtitle>
          <v-chip prepend-icon="mdi-tag" class="mx-2" color="surface">
            {{ release.tag_name }}
          </v-chip>
          <v-chip prepend-icon="mdi-calendar" color="surface">
            {{ release.published_at.toLocaleDateString() }}
          </v-chip>
        </v-card-subtitle>
      </v-card-item>

      <v-card-text>
        <div class="mt-3">
          <v-btn
            rounded="pill"
            color="surface"
            variant="outlined"
            class="mr-4 mb-4 text-lowercase font-weight-light"
            :href="release.html_url"
          >
            <span class="d-flex align-baseline">
              {{ $t("RELEASE.BUTTONS.GITHUB") }}
              <v-icon right class="ml-2"> fa:fab fa-github </v-icon>
            </span>
          </v-btn>
          <v-btn
            rounded="pill"
            variant="outlined"
            color="surface"
            class="mb-4 text-lowercase font-weight-light"
            @click="dialog = true"
          >
            <span class="d-flex align-baseline">
              {{ $t("RELEASE.BUTTONS.NOTES") }}
              <v-icon right class="ml-2"> fa:far fa-note-sticky </v-icon>
            </span>
          </v-btn>
        </div>
      </v-card-text>
      <v-card-actions class="d-flex flex-wrap">
        <v-btn
          class="mx-2"
          v-for="asset in release.assets"
          :key="asset.id"
          :href="asset.browser_download_url"
        >
          {{
            $t("RELEASE.BUTTONS.DOWNLOAD", [
              getFileExtension(asset.name),
              getFileSize(asset.size),
            ])
          }}
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
import { filesize } from "filesize";

const release: Ref<UnwrapRef<Release | null>> = useLatestRelease();
const dialog = ref(false);
const getFileExtension = (fileName: string) =>
  fileName.split(".").slice(1).join(".");
const getFileSize = (size: number) => filesize(size);
</script>

<style lang="scss">
@import "external";

.notes-dialog {
  background: #14162a;
}
</style>
