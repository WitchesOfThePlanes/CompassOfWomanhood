import { onMounted, ref, watch } from "vue";
import DOMPurify from "dompurify";

import { i18n } from "@/plugins/i18n";
import { getTeamContent } from "@/api/github/api";
import { marked } from "marked";

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
