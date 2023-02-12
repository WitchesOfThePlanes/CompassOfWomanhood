import { httpClient } from "./http-client";
import { routes } from "./routes";
import { Release } from "./release.schema";

// TODO: error handling
export const getTeamContent = async (locale: string): Promise<string> => {
  const res = await httpClient.get(routes.teamFile(locale), {
    headers: {
      Accept: "application/vnd.github.raw",
    },
  });
  return res.data;
};

export const getInstallationContent = async (
  locale: string
): Promise<string> => {
  const res = await httpClient.get(routes.installationFile(locale), {
    headers: {
      Accept: "application/vnd.github.raw",
    },
  });
  return res.data;
};

export const getLatestRelease = async (): Promise<Release> => {
  const res = await httpClient.get(routes.releaseList, {
    headers: {
      Accept: "application/vnd.github.raw",
    },
  });
  // TODO: remove this after first no-draft release
  const latestReleaseIndex = res.data.length - 1;
  return res.data[latestReleaseIndex];
};
