import { createI18n } from "vue-i18n";
import en_US from "@/assets/locale/en_US.json";
import pl_PL from "@/assets/locale/pl_PL.json";

const messages = {
  en_US: en_US,
  pl_PL: pl_PL,
};

export const i18n = createI18n({
  locale: "en_US", // set locale
  messages, // set locale messages
});
