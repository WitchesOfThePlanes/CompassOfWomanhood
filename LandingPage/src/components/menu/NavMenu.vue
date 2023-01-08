<template>
  <v-btn-toggle
    v-model="activeSection"
    class="h-screen d-flex align-end justify-center flex-column pa-6 nav-menu text-right"
  >
    <v-btn
      class="pa-2 button"
      v-for="locale in $i18n.availableLocales"
      :key="`locale-${locale}`"
      :class="$i18n.locale === locale && 'active'"
      variant="plain"
      @click="changeLocale(locale)"
    >
      {{ locale.split("_")[0] }}
    </v-btn>

    <v-btn
      v-for="link in linksConfig"
      :key="link.id"
      class="button pa-2"
      selected-class="active"
      :value="link.id"
      variant="plain"
      @click="goToMenu(link.id)"
    >
      {{ $t(link.content) }}
    </v-btn>
    <span class="breaker mt-10" />
    <v-btn
      v-for="social in socialLinksConfig"
      :key="social.id"
      variant="text"
      :icon="`fa:fab fa-${social.id}`"
      class="pa-2"
      :href="social.link"
      target="_blank"
    />
  </v-btn-toggle>
</template>

<script setup lang="ts">
import { i18n } from "@/plugins/i18n";
import { useScrollTo } from "@/utils/scroll-to.composable";
import { ref, watch } from "vue";

import { linksConfig, socialLinksConfig } from "./links.config";

interface INavMenuProps {
  activeSection?: string;
}

const props = defineProps<INavMenuProps>();
const activeSection = ref();
const emit = defineEmits(["close-mobile-menu"]);

const { scrollTo } = useScrollTo();

const goToMenu = (section: string) => {
  emit("close-mobile-menu");
  scrollTo(section);
  activeSection.value = section;
};

const changeLocale = (locale: string) => {
  i18n.global.locale = locale as typeof i18n.global.locale;
  emit("close-mobile-menu");
};

watch(
  () => props.activeSection,
  async (newSection) => {
    if (newSection) {
      activeSection.value = newSection;
    }
  }
);
</script>

<style scoped>
.nav-menu {
  position: fixed;
  right: 0;
  width: 200px;
}

.button {
  font-weight: 300;
  display: flex;
  justify-content: end;
  opacity: 1;
}

.button:hover {
  color: #f9b24b;
}

.active {
  font-weight: 500;
  color: #f9b24b;
}
</style>
