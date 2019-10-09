module.exports = {
  // 支持 typscript 语法检测
  parser: '@typescript-eslint/parser',
  extends: 'eslint-config-alloy',
  // 添加规则
  plugins: [
    '@typescript-eslint',
    // 'typescript',
  ],
  // 运行环境
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
    eqeqeq: [ 2, 'always', { null: 'ignore' } ],
    'no-undef': 2,
    'no-unused-vars': 1,
  },
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      rules: {
        // 修复 ts 的问题：使用接口类型，但报未使用错误
        '@typescript-eslint/no-unused-vars': [2, { args: 'none' }],
      }
    }
  ]
};
