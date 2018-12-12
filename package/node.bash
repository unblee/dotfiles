#!/bin/bash

type yarn > /dev/null 2>&1
if [[ $? == 0 ]]; then
  npm_cmd="yarn global add"
else
  npm_cmd="npm install --global"
fi

$npm_cmd \
  \ eslint
  \ eslint_d
  \ typescript
  \ tern
  \ fixpack
  \ prettier
  \ stylefmt
  \ prettier-eslint
  \ prettier-eslint-cli
  \ editorconfig-cli
  \ now
  \ vue-language-server
