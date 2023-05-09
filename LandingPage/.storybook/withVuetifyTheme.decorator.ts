import { defineComponent, h } from "vue";
import { VApp, VMain } from "vuetify/components";

const VuetifyStoryWrapper = defineComponent({
  name: "storybook-vuetify-story-wrapper",
  setup(props, { slots }) {
    return () => h(VApp, props, () => h(VMain, slots.default));
  },
});

export const withVuetifyTheme = (storyFn, context) => {
  const story = storyFn();

  return () => {
    return h(VuetifyStoryWrapper, () => h(story, { ...context.args }));
  };
};
