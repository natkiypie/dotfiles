# React Development Configuration Files

#### TODO: move this content to vimwiki or vim-orgmode asap

## This folder contains the config files you will need for your React projects

### ESLINT

Source: [shareable configs designed to work with the extends feature of .eslintrc files](https://github.com/standard/eslint-config-standard-react#readme) 

1. Install

`npm install --save-dev babel-eslint eslint-config-standard eslint-config-standard-jsx eslint-config-standard-react eslint-plugin-promise eslint-plugin-import eslint-plugin-node eslint-plugin-react`

2. Then, add this to your .eslintrc file:

```JSON
{
  "parser": "babel-eslint",
  "extends": ["standard", "standard-jsx", "standard-react"]
}
```

### ESLINTIGNORE

```
**/node_modules/*
**/*.min.js
**/vendor/*
**/coverage/*
**/build/*
**/docs/*
```

### PRETTIER

```JSON
{
  "printWidth": 85,
  "arrowParens": "always",
  "semi": false,
  "trailingComma": "none",
  "useTabs": false,
  "tabWidth": 2,
  "singleQuote": true
}
```

### RELEVANT CONTENT

* [eslint rules](https://eslint.org/docs/rules/) 
* [prettier options](https://prettier.io/docs/en/options.html) 
* [utilities to improve the typeScript development experience for neovim's built-in lsp client](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils) 
* [use neovim as a language server to inject lsp diagnostics, code actions, and more via lua](https://github.com/jose-elias-alvarez/null-ls.nvim) 
* [wanna run prettier in your editor, but fast? welcome to prettierd!](https://github.com/fsouza/prettierd) 
