# React Development Configuration Files

#### TODO: move this content to vimwiki or vim-orgmode asap

## This folder contains the config files you will need for your React projects

### NODE.JS GLOBAL PACKAGES
* Install
`npm install -g eslint eslint_d @fsouza/prettierd tree-sitter tree-sitter-cli ts-node typescript typescript-language-server vscode-langservers-extracted commitizen cz-conventional-changelog`

### ESLINT

Source: [shareable configs designed to work with the extends feature of .eslintrc files](https://github.com/standard/eslint-config-standard-react#readme) 

* Install
`npm install --save-dev babel-eslint eslint-config-standard eslint-config-standard-jsx eslint-config-standard-react eslint-plugin-promise eslint-plugin-import eslint-plugin-node eslint-plugin-react`

* Then, add this to your .eslintrc file:

```JSON
{
  "parser": "babel-eslint",
  "extends": ["standard", "standard-jsx", "standard-react"],
  "rules": {
    "space-before-function-paren": ["error", "never"],
    "multiline-ternary": ["off"],
    <!-- Until I start using typescript -->
    "react/prop-types": ["off"]
  }
}
```

### ESLINTIGNORE

* Add this to your .eslintignore file:

```
**/node_modules/*
**/*.min.js
**/vendor/*
**/coverage/*
**/build/*
**/docs/*
```

### PRETTIER

* Add this to your .prettierrc.json file:

```JSON
{
  "printWidth": 85,
  "arrowParens": "always",
  "semi": false,
  "trailingComma": "none",
  "useTabs": false,
  "tabWidth": 2,
  "singleQuote": true,
  "jsxSingleQuote": true
}
```

### JSCONFIG V TSCONFIG

* To enable type checking on JavaScript files and to enable `:TSLspImportAll`, add this to your jsconfig.json or tsconfig.json file:

```JSON
{
  "compilerOptions": {
    "module": "commonjs",
    "target": "es6",
    "jsx": "react",
    "allowJs": true,
    "checkJs": true
  }
}
```

### RELEVANT CONTENT

* [eslint rules](https://eslint.org/docs/rules/) 
* [prettier options](https://prettier.io/docs/en/options.html) 
* [utilities to improve the typeScript development experience for neovim's built-in lsp client](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils) 
* [use neovim as a language server to inject lsp diagnostics, code actions, and more via lua](https://github.com/jose-elias-alvarez/null-ls.nvim) 
* [wanna run prettier in your editor, but fast? welcome to prettierd!](https://github.com/fsouza/prettierd) 
