<template>
  <v-btn-toggle
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
      {{ locale }}
    </v-btn>

    <v-btn
      class="button pa-2"
      selected-class="active"
      value="about"
      variant="plain"
      @click="goToMenu('about')"
    >
      {{ $t("MENU.ABOUT") }}
    </v-btn>
    <v-btn
      class="button pa-2"
      selected-class="active"
      variant="plain"
      @click="goToMenu('characters')"
      >{{ $t("MENU.CHARACTERS") }}
    </v-btn>
    <v-btn class="button pa-2" variant="plain" :href="ghLink" target="_blank">
      {{ $t("MENU.READ_MORE") }}
    </v-btn>
    <v-btn variant="text" icon="fa:fab fa-facebook" class="mt-10 pa-2" />
    <v-btn variant="text" icon="fa:fab fa-youtube" class="pa-2" />
    <v-btn variant="text" icon="fa:fab fa-twitter" class="pa-2" />
  </v-btn-toggle>
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

.button {
  font-weight: 300;
  display: flex;
  justify-content: end;
}

.active {
  font-weight: 500;
  color: #f9b24b;
}
</style>
