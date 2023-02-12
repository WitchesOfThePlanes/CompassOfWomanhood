import { onMounted, ref, watch } from "vue";
import DOMPurify from "dompurify";
import { i18n } from "@/plugins/i18n";
import { marked } from "marked";

import {
  getInstallationContent,
  getLatestRelease,
  getTeamContent,
} from "./github/api";
import { Release, ReleaseSchema } from "./github/release.schema";

export const useTeamContent = () => {
  const data = ref<string | null>(null);

  const getData = async (locale: typeof i18n.global.locale) => {
    const res = await getTeamContent(locale);
    data.value = DOMPurify.sanitize(marked.parse(res));
  };

  watch(
    () => i18n.global.locale,
    async (newLocale) => {
      await getData(newLocale);
    }
  );

  onMounted(async () => {
    await getData(i18n.global.locale);
  });
  return data;
};

export const useInstallationContent = () => {
  const data = ref<string | null>(null);

  const getData = async (locale: typeof i18n.global.locale) => {
    //TODO: change markdowns structure
    const startInstallationSection = i18n.global.t("INSTALLATION_SEPARATOR");
    const res = await getInstallationContent(locale);
    data.value = DOMPurify.sanitize(
      marked.parse(res.split(startInstallationSection)[1])
    );
  };

  watch(
    () => i18n.global.locale,
    async (newLocale) => {
      await getData(newLocale);
    }
  );

  onMounted(async () => {
    await getData(i18n.global.locale);
  });
  return data;
};

export const useLatestRelease = () => {
  const data = ref<Release | null>(null);
  const getData = async () => {
    const res = await getLatestRelease();
    const parsedRelease = ReleaseSchema.parse(res);
    data.value = {
      ...parsedRelease,
      body:
        parsedRelease.body &&
        DOMPurify.sanitize(marked.parse(parsedRelease.body)),
    };
  };

  onMounted(async () => {
    await getData();
  });

  return data;
};
