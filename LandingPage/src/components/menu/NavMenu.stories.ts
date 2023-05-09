import type {
  Meta,
  StoryContext,
  StoryObj,
  VueRenderer,
} from "@storybook/vue3";

import NavMenu from "./NavMenu.vue";
import { MENU_ITEM } from "./links.config";
import { TNavMenuProps } from "./nav-menu.composable";

const meta: Meta<typeof NavMenu> = {
  title: "NavMenu",
  component: NavMenu,
};

export default meta;

type Story = StoryObj<typeof NavMenu>;

export const MainNavMenu: Story = {
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
