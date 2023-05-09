import { expect } from "@storybook/jest";
import { within, userEvent } from "@storybook/testing-library";
import type { Meta, StoryContext, StoryObj } from "@storybook/vue3";

import NavMenu from "./NavMenu.vue";
import { MENU_ITEM } from "./links.config";
import { TNavMenuProps } from "./nav-menu.composable";
import { i18n } from "@/plugins/i18n";

const meta: Meta<typeof NavMenu> = {
  title: "NavMenu",
  component: NavMenu,
};

export default meta;

type Story = StoryObj<typeof NavMenu>;

export const MainNavMenu: Story = {
  play: async ({
    canvasElement,
    step,
  }: {
    canvasElement: HTMLElement;
    step: (desc: string, callback: () => void) => void;
  }) => {
    const canvas = within(canvasElement);
    i18n.global.locale = "en_US";

    await step("Use main menu", async () => {
      await userEvent.click(canvas.getByTestId("about"));
      await expect(canvas.getByTestId("about")).toHaveClass("active");
    });

    await step("Change language", async () => {
      await expect(canvas.getByText("about")).toBeInTheDOM();
      await userEvent.click(canvas.getByTestId("pl_PL"));
      await expect(canvas.getByText("o projekcie")).toBeInTheDOM();
    });
  },
  render: (args: TNavMenuProps, { argTypes }: StoryContext<TNavMenuProps>) => ({
    components: { NavMenu },
    props: Object.keys(argTypes),
    template: `<NavMenu v-bind="$props" />`,
  }),
  args: {
    activeSection: undefined,
  },
  argTypes: {
    activeSection: {
      options: [...Object.values(MENU_ITEM), undefined],
      control: { type: "select" },
    },
  },
};
