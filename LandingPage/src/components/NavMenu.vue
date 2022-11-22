<template>
  <nav
    class="h-screen d-flex align-end justify-center flex-column pa-6 nav-menu text-right"
  >
    <v-btn
      v-for="locale in $i18n.availableLocales"
      :key="`locale-${locale}`"
      :variant="$i18n.locale === locale ? 'text' : 'plain'"
      @click="changeLocale(locale)"
    >
      {{ locale }}
    </v-btn>
    <v-btn variant="plain" @click="goToMenu('about')">
      {{ $t("MENU.ABOUT") }}
    </v-btn>
    <v-btn variant="plain" @click="goToMenu('characters')"
      >{{ $t("MENU.CHARACTERS") }}
    </v-btn>
    <v-btn variant="plain" :href="ghLink" target="_blank">
      {{ $t("MENU.READ_MORE") }}
    </v-btn>
    <v-btn variant="text" icon="fa:fab fa-facebook" class="mt-10" />
    <v-btn variant="text" icon="fa:fab fa-youtube" />
    <v-btn variant="text" icon="fa:fab fa-twitter" />
  </nav>
</template>

<script setup lang="ts">
import { i18n } from "@/plugins/i18n";
import { useScrollTo } from "@/composables/scroll-to";

const emit = defineEmits(["close-mobile-menu"]);

const { scrollTo } = useScrollTo();

const ghLink = import.meta.env.VITE_APP_GH_LINK;

const goToMenu = (section: string) => {
  emit("close-mobile-menu");
  scrollTo(section);
};

const changeLocale = (locale: string) => {
  i18n.global.locale = locale as typeof i18n.global.locale;
  emit("close-mobile-menu");
};
</script>

<style scoped>
.nav-menu {
  position: fixed;
  right: 0;
  width: 200px;
}
</style>
