import { createI18n } from "vue-i18n";
import en from "@/assets/en.json";
import pl from "@/assets/pl.json";

const messages = {
  en: en,
  pl: pl,
};

export const i18n = createI18n({
  locale: "en", // set locale
  messages, // set locale messages
});
