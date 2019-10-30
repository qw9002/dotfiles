module.exports = {
  // 支持 typscript 语法检测
  parser: '@typescript-eslint/parser',
  extends: 'eslint-config-alloy',
  // 添加规则
  plugins: [
    '@typescript-eslint'
    // 'typescript'
  ],
  // 运行环境
  env: {
    browser: true, // 浏览器
    node: true,
    es6: true
  },
  globals: {
    Atomics: 'readonly',
    SharedArrayBuffer: 'readonly'
  },
  parserOptions: {
    ecmaVersion: 2017, // ECMA 2017 标准
    sourceType: 'module', // module 模式
    ecmaFeatures: { jsx: true }
  },
  // off: 0, warn: 1, error: 2
  rules: {
    semi: 2,
    eqeqeq: [
      2, 'always', { null: 'ignore' }
    ],
    'no-undef': 2,
    'no-unused-vars': 1
  },
  overrides: [
    {
      files: ['*.ts', '*.tsx'],
      rules: {
        // 修复 ts 的问题：使用接口类型，但报未使用错误
        '@typescript-eslint/no-unused-vars': [
          2, { args: 'none' }
        ]
      }
    }
  ]
};
