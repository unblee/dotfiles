#!/bin/bash

for s in $(find ${DOTFILES}/package/*)
do
  [[ $s == "${DOTFILES}/package/all.bash" ]] && continue
  bash $s
done
