/// <reference types="vite/client" />
interface ImportMetaEnv {
  readonly VITE_APP_GH_LINK: string;
  readonly VITE_APP_GH_API: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
