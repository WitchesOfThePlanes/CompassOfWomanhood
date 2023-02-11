import { Buffer } from "buffer";

// NOTE: can be removed after JS Buffer is supported in vite
window.Buffer = window.Buffer || Buffer;

export const decode = (str: string): string => {
  return window.Buffer.from(str, "base64").toString();
};
