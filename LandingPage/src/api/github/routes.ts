export const routes = {
  teamFile: (locale: string) =>
    `/contents/CompassOfWomanhood/translations/${locale}/team.md`,
  installationFile: (locale: string) =>
    `/contents/CompassOfWomanhood/translations/${locale}/about.md`,
  // TODO: change to /releases/latest after first no-draft release
  releaseList: "/releases",
};
