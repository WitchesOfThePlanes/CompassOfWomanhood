<template>
  <div
    v-if="!state.mobileMenuOpen"
    class="h-screen d-flex align-end justify-start flex-column pa-6 mobile-nav-menu"
  >
    <v-btn variant="text" icon="fa:fas fa-bars" @click="openMenu()" />
  </div>
  <div v-else class="h-screen w-100 mobile-nav-menu bg-dark">
    <div
      class="h-screen w-100 menu-background"
      :style="{ backgroundImage: `url(${bgImagePath})` }"
    />
    <div class="menu-content">
      <div class="d-flex align-end justify-start flex-column pa-6">
        <v-btn variant="text" icon="fa:fas fa-times" @click="closeMenu()" />
      </div>

      <div
        class="d-flex flex-column justify-start align-start px-6 py-12 menu-buttons"
      >
        <v-list-item
          class="button px-6 py-2"
          selected-class="active"
          :value="MENU_ITEM.HOME"
          variant="text"
          @click="goToMenu(MENU_ITEM.HOME)"
        >
          {{ $t("MENU.HOME") }}
        </v-list-item>
        <v-list-item
          v-for="link in linksConfig"
          :key="link.id"
          class="button px-6 py-2"
          selected-class="active"
          :value="link.id"
          variant="text"
          @click="goToMenu(link.id)"
        >
          {{ $t(link.content) }}
        </v-list-item>
      </div>

      <div class="px-12">
        <v-btn-toggle v-model="$i18n.locale" rounded="xl" mandatory divided>
          <v-btn
            selected-class="active"
            variant="outlined"
            size="large"
            v-for="locale in $i18n.availableLocales"
            :key="`locale-${locale}`"
            :value="locale"
            @click="changeLocale(locale)"
          >
            {{ locale.split("_")[0] }}
          </v-btn>
        </v-btn-toggle>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive } from "vue";

import bgImagePath from "@/assets/home-bg.svg?url";
import { linksConfig, socialLinksConfig, MENU_ITEM } from "./links.config";
import { useScrollTo } from "@/utils/scroll-to.composable";
import { i18n } from "@/plugins/i18n";

const state = reactive({ mobileMenuOpen: false, langMenu: false });
const { scrollTo } = useScrollTo();

const openMenu = () => (state.mobileMenuOpen = true);
const closeMenu = () => (state.mobileMenuOpen = false);

const goToMenu = (section: string) => {
  scrollTo(section);
  closeMenu();
};

const changeLocale = (locale: string) => {
  i18n.global.locale = locale as typeof i18n.global.locale;
};
</script>

<style scoped>
.mobile-nav-menu {
  position: fixed;
  right: 0;
  top: 0;
}
.bg-dark {
  background: #14162a;
  position: fixed;
}
.menu-background {
  position: absolute;
  right: 0;
  top: 0;
  background-size: cover;
  background-position: 60% center;
  background-repeat: no-repeat;
  opacity: 0.2;
}
.menu-content {
  position: relative;
}
.button {
  font-style: normal;
  font-weight: 700;
  font-size: 32px;
  line-height: 39px;
  text-transform: uppercase;
}

.active {
  font-weight: 500;
  color: #f9b24b;
}
.menu-label {
  pointer-events: none;
}
.menu-label-active {
  background-color: transparent;
}
</style>
