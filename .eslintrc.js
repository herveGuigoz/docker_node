module.exports = {
  root: true,
  env: {
    browser: true,
    node: true
  },
  parserOptions: {
    parser: 'babel-eslint',
    ecmaVersion: 2018,
    sourceType: 'module'
  },
  extends: [
    'eslint:recommended',
    'standard',
    'plugin:vue/recommended',
    '@nuxtjs'
  ],
  plugins: [
    'vue',
    'vuetify'
  ],
  // add your custom rules here
  rules: {
    'vue/max-attributes-per-line': 'off',
    "no-console": 1, // Allows console.log
    'vuetify/no-deprecated-classes': 'error',
    'vuetify/grid-unknown-attributes': 'error',
    'vuetify/no-legacy-grid': 'error',
    "eqeqeq": "warn",
    'no-unneeded-ternary': 'warn',
    'no-whitespace-before-property': 'warn',
  }
}
