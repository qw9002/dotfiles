module.exports = {
  parser: '@typescript-eslint/parser',
  plugins: [
    'typescript',
  ],
  env: {
    browser: true,
    node: true,
    es6: true,
  },
  extends: 'eslint-config-egg',
  globals: {
    Atomics: 'readonly',
    SharedArrayBuffer: 'readonly',
  },
  parserOptions: {
    ecmaVersion: 2017,
    sourceType: 'module',
    ecmaFeatures: {
      jsx: true,
    },
  },
  rules: {
    semi: 'error',
    eqeqeq: ['error', 'always', { null: 'ignore', }],
    'no-unused-vars': 1,
    'typescript/no-unused-vars': 1,
    'typescript/class-name-casing': 'error',
  },
};
