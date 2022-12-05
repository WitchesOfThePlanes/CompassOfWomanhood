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
      <h2 class="text-md-h4 my-6">
        {{ $t(`CHARACTERS.${props.characterName}.NAME`) }}
      </h2>
      <div
        class="mt-5"
        v-html="$t(`CHARACTERS.${props.characterName}.INTRO`)"
      />
      <div
        class="mt-5 font-weight-medium"
        v-html="$t(`CHARACTERS.${props.characterName}.FEATURES.INTRO`)"
      />
      <ul
        v-if="$te(`CHARACTERS.${props.characterName}.FEATURES.LIST`)"
        class="ml-6"
      >
        <li
          v-for="(item, index) in $tm(
            `CHARACTERS.${props.characterName}.FEATURES.LIST`
          )"
          :key="index"
        >
          {{ $t(item) }}
        </li>
      </ul>
      <div
        v-if="$te(`CHARACTERS.${props.characterName}.PLACE`)"
        class="mt-5 font-weight-medium"
      >
        {{ $t(`CHARACTERS.${props.characterName}.PLACE`) }}
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import imgCaly from "@/assets/caly.png";
import imgShithri from "@/assets/shithri.png";

interface ICharacterDetailsProps {
  characterName: "SHITHRI" | "CALY";
  layout: "left" | "right";
}

const props = defineProps<ICharacterDetailsProps>();
</script>

<style scoped>
.character-image {
  max-width: 90vw;
}
</style>
