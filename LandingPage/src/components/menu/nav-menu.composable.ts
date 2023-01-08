import { Ref, ref, watch } from "vue";

export type INavMenuProps = {
  activeSection?: string;
};

export interface INavMenuReturns {
  activeSection: Ref<string | undefined>;
  setActiveSection: (section: string) => void;
}

export const useNavMenu = (props: INavMenuProps): INavMenuReturns => {
  const activeSection = ref();

  const setActiveSection = (section: string) => (activeSection.value = section);

  watch(
    () => props.activeSection,
    async (newSection) => {
      if (newSection) {
        activeSection.value = newSection;
      }
    }
  );

  return {
    activeSection,
    setActiveSection,
  };
};
