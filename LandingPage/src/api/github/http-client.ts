import axios from "axios";

const ghLink = import.meta.env.VITE_APP_GH_API;

export const httpClient = axios.create({
  baseURL: ghLink,
});
