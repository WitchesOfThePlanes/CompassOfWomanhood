interface IScrollToProps {
  scrollTo: (section: string) => void;
}

export const useScrollTo = (): IScrollToProps => {
  const scrollTo = (section: string) => {
    const el = document.getElementById(section);
    el &&
      el.scrollIntoView({
        behavior: "smooth",
      });
  };

  return { scrollTo };
};
