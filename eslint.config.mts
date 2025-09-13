import globals from "globals";
import tseslint from "typescript-eslint";
import {defineConfig} from "eslint/config";

export default defineConfig([
  {
    ignores: ["node_modules", "dist"],
  },
  tseslint.configs.recommended,
  {
    files: ["**/*.{js,mjs,cjs,ts,mts,cts}"],
    languageOptions: { globals: globals.node },
    rules: {
      "@typescript-eslint/no-explicit-any": "off",
    },
  },
]);
