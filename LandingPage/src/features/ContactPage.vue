<template>
  <div
    id="contact"
    class="d-flex flex-column align-center justify-center py-10 px-6 contact"
  >
    <div :class="smAndUp && 'page'">
      <div data-aos="fade-up">
        <h2 class="mt-16 mb-10 d-flex">
          <SectionTitle>
            <img class="sword" :src="swordPng" />
            {{ $t("CONTACT.TITLE") }}
          </SectionTitle>
        </h2>
        <div class="mt-2 mb-6">
          {{ $t("CONTACT.HELLO") }}
        </div>
        <div class="mt-2 mb-4">
          {{ $t("CONTACT.EMAIL") }}
        </div>
        <div class="mb-10 email">
          <a title="email" href="#contact" ref="linkEl" @click="handleClick"
            ><img class="email-img" :src="emailImgPath"
          /></a>
        </div>
      </div>
    </div>
    <div :class="smAndUp ? 'divider' : 'page'">
      <v-divider />
    </div>
    <div v-if="smAndUp" class="page d-flex flex-row pt-6 align-center">
      <img
        class="logo pa-4"
        :src="$i18n.locale === plLocale ? logoPlImagePath : logoImagePath"
        alt="logo-small"
      />
      <div>
        <v-btn-toggle class="d-flex align-end justify-center flex-row ma-6">
          <v-btn
            v-for="link in linksConfig"
            :key="link.id"
            class="button pa-2"
            selected-class="active"
            :value="link.id"
            variant="text"
            @click="goToMenu(link.id)"
          >
            {{ $t(link.content) }}
          </v-btn>
        </v-btn-toggle>
        <v-btn-toggle class="d-flex align-end justify-center flex-row ma-6">
          <v-btn
            v-for="social in socialLinksConfig"
            :key="social.id"
            variant="text"
            :icon="`fa:fab fa-${social.id}`"
            class="mx-3 py-2"
            :href="social.link"
            target="_blank"
          />
        </v-btn-toggle>
      </div>
    </div>
    <div v-else>
      <v-btn-toggle class="d-flex align-end justify-center flex-row ma-6">
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
    </div>
    <v-snackbar
      color="surface"
      content-class="email-snackbar"
      v-model="snackbar"
      rounded="pill"
    >
      {{ $t("CONTACT.SNACKBAR") }}

      <template #actions>
        <v-btn rounded="pill" variant="text" @click="snackbar = false">
          {{ $t("CONTACT.CLOSE") }}
        </v-btn>
      </template>
    </v-snackbar>
  </div>
</template>

<script setup lang="ts">
import { ref } from "vue";
import { useDisplay } from "vuetify";

import swordPng from "@/assets/Sword.png";
import SectionTitle from "@/components/SectionTitle.vue";
import { linksConfig, socialLinksConfig } from "@/components/menu/links.config";
import emailImgPath from "@/assets/email.svg?url";
import logoImagePath from "@/assets/logo-small.png";
import logoPlImagePath from "@/assets/logo-small-pl.png";
import { i18n } from "@/plugins/i18n";
import { useScrollTo } from "@/utils/scroll-to.composable";
import { decode } from "@/utils/base64";

const plLocale: typeof i18n.global.locale = "pl_PL";
const email = import.meta.env.VITE_APP_EMAIL;
const linkEl = ref<HTMLLinkElement | null>(null);
const snackbar = ref<boolean>(false);

const { smAndUp } = useDisplay();

const handleClick = async () => {
  if (linkEl.value) {
    await navigator.clipboard.writeText(decode(email));
    snackbar.value = true;
  }
};
const { scrollTo } = useScrollTo();

const goToMenu = (section: string) => {
  scrollTo(section);
};
</script>

<style scoped>
.page {
  width: 60vw;
}
.divider {
  width: 70vw;
}
.contact {
  background: #14162a;
}
.sword {
  margin-right: 16px;
  max-height: 2em;
}
.email {
  color: #a2c3e8;
}
.email-img {
  width: 28ch;
}
.email-snackbar {
  color: #ffffff;
}

.logo {
  max-height: 100px;
}
</style>
