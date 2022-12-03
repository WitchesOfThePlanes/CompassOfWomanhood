/**
 * main.ts
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */

// Components
import App from "./App.vue";

// Composables
import { createApp } from "vue";
import AOS from "aos";
import "aos/dist/aos.css";

// Plugins
import { registerPlugins } from "@/plugins";

AOS.init({
  duration: 2000,
  once: true,
});

const app = createApp(App);

registerPlugins(app);

app.mount("#app");
