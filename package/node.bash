#!/bin/bash

type yarn > /dev/null 2>&1
if [[ $? == 0 ]]; then
  npm_cmd="yarn global add"
else
  npm_cmd="npm install --global"
fi

$npm_cmd eslint
$npm_cmd eslint_d
$npm_cmd typescript
$npm_cmd tern
$npm_cmd fixpack
$npm_cmd prettier
$npm_cmd stylefmt
$npm_cmd prettier-eslint
$npm_cmd prettier-eslint-cli
$npm_cmd editorconfig-cli
