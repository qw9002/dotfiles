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
    'no-undef': 'error',
    'no-unused-vars': 1,
    'typescript/no-unused-vars': 1,
    'typescript/class-name-casing': 'error',
  },
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      rules: {
        '@typescript-eslint/no-unused-vars': [2, { args: 'none' }]
      }
    }
  ]
};
