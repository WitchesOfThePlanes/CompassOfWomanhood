import { httpClient } from "./http-client";
import { routes } from "@/api/github/routes";

// TODO: error handling
export const getTeamContent = async (locale: string): Promise<string> => {
  const res = await httpClient.get(routes.teamFile(locale), {
    headers: {
      Accept: "application/vnd.github.raw",
    },
  });
  return res.data;
};
