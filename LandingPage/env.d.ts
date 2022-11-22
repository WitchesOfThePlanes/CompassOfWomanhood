/// <reference types="vite/client" />
interface ImportMetaEnv {
  readonly VITE_APP_GH_LINK: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
