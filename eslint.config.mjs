import globals from "globals";
import tseslint from "typescript-eslint";
import { defineConfig } from "eslint/config";
export default defineConfig([
    {
        ignores: ["node_modules", "dist"],
    },
    {
        files: ["**/*.{js,mjs,cjs,ts,mts,cts}"],
        languageOptions: { globals: globals.node },
    },
    tseslint.configs.recommended,
]);
