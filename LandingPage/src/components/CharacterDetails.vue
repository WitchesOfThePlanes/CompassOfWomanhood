<template>
  <div
    class="d-md-flex w-100 align-center justify-center pa-6"
    :class="props.layout === 'left' ? 'flex-row' : 'flex-row-reverse'"
  >
    <div class="text-center">
      <img
        class="character-image"
        :src="props.characterName === 'CALY' ? imgCaly : imgShithri"
        :alt="`${props.characterName}-portait`"
      />
    </div>
    <div
      class="d-flex align-start justify-center flex-column pa-md-6 text-left"
    >
      <h2 class="character-name mt-5">
        {{ $t(`CHARACTERS.${props.characterName}.NAME`) }}
      </h2>
      <div
        class="mt-5"
        v-html="$t(`CHARACTERS.${props.characterName}.INTRO`)"
      />
      <div v-if="$te(`CHARACTERS.${props.characterName}.FEATURES`)">
        <v-btn
          rounded="pill"
          color="secondary"
          variant="outlined"
          class="mt-5 text-lowercase font-weight-light"
          @click="dialog = true"
        >
          <span class="d-flex align-baseline">
            {{ $t("CHARACTERS.BUTTONS.READ_MORE") }}
          </span>
        </v-btn>
        <v-dialog v-model="dialog" max-width="90vw" width="400px">
          <v-card class="details-dialog rounded-xl">
            <v-card-text>
              <div class="mt-5 font-weight-medium">
                {{ $t(`CHARACTERS.${props.characterName}.FEATURES.INTRO`) }}
              </div>
              <ul class="ml-6 font-weight-light">
                <li
                  class="mt-1"
                  v-for="(item, index) in $tm(
                    `CHARACTERS.${props.characterName}.FEATURES.LIST`
                  )"
                  :key="index"
                >
                  {{ $t(item) }}
                </li>
              </ul>
            </v-card-text>
            <v-card-actions class="d-flex justify-center">
              <v-btn
                rounded="pill"
                color="secondary"
                variant="outlined"
                class="ma-5 text-lowercase font-weight-light"
                @click="dialog = false"
              >
                {{ $t("CHARACTERS.BUTTONS.CLOSE") }}</v-btn
              >
            </v-card-actions>
          </v-card>
        </v-dialog>
      </div>
      <div
        v-if="$te(`CHARACTERS.${props.characterName}.STATUS`)"
        class="mt-5 font-weight-thin"
      >
        {{ $t(`CHARACTERS.${props.characterName}.STATUS`) }}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import imgCaly from "@/assets/caly.png";
import imgShithri from "@/assets/shithri.png";
import { ref } from "vue";

interface ICharacterDetailsProps {
  characterName: "SHITHRI" | "CALY";
  layout: "left" | "right";
}

const props = defineProps<ICharacterDetailsProps>();

const dialog = ref(false);
</script>

<style scoped>
.character-image {
  max-width: 90vw;
  width: 300px;
}
.character-name {
  font-size: 5vw;
  font-weight: bold;
}
.details-dialog {
  background: #14162a;
}
</style>
