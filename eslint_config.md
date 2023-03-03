# Eslint JSON Example

## Front End CodeceptJS & Jasmine
```json
"env": {
    "jasmine": true,
    "codeceptjs/codeceptjs": true
},
"extends": [
    "plugin:codeceptjs/recommended"
],
"rules": {
    "indent": ["warn", 2],
    "import/no-extraneous-dependencies": 0,
    "no-console": 0,
    "no-underscore-dangle": 0,
    "no-restricted-globals": 0,
    "linebreak-style": 0,
    "consistent-return": 0,
    "no-prototype-builtins": 0,
    "import/prefer-default-export": 0,
    "no-return-assign": 0,
    "class-methods-use-this": 0,
    "no-new": 0,
    "no-plusplus": 0,
    "no-await-in-loop": 0,
    "no-unused-expressions": 0,
    "no-useless-constructor": 0,
    "func-names": 0,
    "prefer-destructuring": 0,
    "no-alert": 0,
    "no-else-return": 0,
    "no-param-reassign": 0,
    "no-lonely-if": 0,
    "no-useless-return": 0,
    "max-len": 0,
    "arrow-body-style": 0,
    "no-unneeded-ternary": 0,
    "camelcase": 0
}
```

## NODEJS API

```json
{
  "env": {
    "es2021": true,
    "node": true
  },
  "extends": "airbnb-base",
  "overrides": [],
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module"
  },
  "rules": {
    "indent": ["warn", 2],
    "semi": ["never"],
    "no-unused-vars": 1,
    "no-console": 0,
    "import/prefer-default-export": 0,
    "consistent-return": 0,
    "radix": 0,
    "no-param-reassign": 0,
    "no-restricted-syntax": 0,
    "eqeqeq": 0,
    "import/extensions": 0,
    "camelcase": 0,
    "func-names": 0,
    "no-use-before-define": 0,
    "arrow-body-style": 0,
    "prefer-const": 1,
    "space-before-blocks": 1,
    "space-infix-ops": 1,
    "no-trailing-spaces": 1,
    "keyword-spacing": 1,
    "no-multi-spaces": [
      1,
      {
        "exceptions": {
          "Property": false
        }
      }
    ],
    "no-multiple-empty-lines": [
      1,
      {
        "max": 1
      }
    ],
    "no-tabs": 0,
    "no-plusplus": 0,
    "no-nested-ternary": 0,
    "no-cond-assign": 0,
    "linebreak-style": 0
  }
}
```