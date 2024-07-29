import eslint from "@eslint/js";
import tseslint from "typescript-eslint";
import react from "eslint-plugin-react";
import pluginQuery from '@tanstack/eslint-plugin-query'

export default tseslint.config(
    eslint.configs.recommended,
    ...tseslint.configs.recommended,
    react.configs.flat["jsx-runtime"],
    ...pluginQuery.configs['flat/recommended'],
);
