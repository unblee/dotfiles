#!/bin/bash

source ${HOME}/dotfiles/bin/env.bash

if [[ ! -e ${HOME}/old_dotfiles ]]; then
  mkdir ${HOME}/old_dotfiles
fi

if [[ "${PLATFORM}" == "windows" ]]; then
  grep -q -E "^#MSYS=winsymlinks" /c/msys64/mingw64.ini
  if [[ $? -eq 0 ]]; then
    find /c/msys64 | grep -E "(mingw..\.ini|msys2\.ini)" | xargs sed -i.org -r -e "s/#(MSYS=winsymlinks.+$)/\1/" -e "s/#(MSYS2_PATH_TYPE=.+$)/\1/"
    echo
    echo "Please restart terminal"
    echo
    exit 1
  fi
fi

make_ln_script() {
  for FILE in $(ls -A ${1}); do
    local src=${1}/${FILE}
    local dst=${2}/${FILE}
    local old=${HOME}/old_dotfiles/${FILE}

    if [[ -L ${dst} ]]; then
      rm -f ${dst}
    elif [[ -e ${dst} ]]; then
      [[ -e ${old} ]] && rm -fr ${old}
      echo mv -f ${dst} ${old}
      mv -f ${dst} ${old}
    fi

    echo "echo ln -s ${src} ${dst}" >> /tmp/tmp_link.bash
    echo ln -s ${src} ${dst} >> /tmp/tmp_link.bash
  done
}

cd ${DOTFILES}

make_ln_script ${DOTFILES}/rc ${HOME}
make_ln_script ${DOTFILES}/config ${HOME}/.config

echo touch /tmp/tmp_link.lock >> /tmp/tmp_link.bash
if [[ "${PLATFORM}" == "windows" ]]; then
  powershell.exe -Command Start-Process "/c/msys64/mingw64.exe 'bash /tmp/tmp_link.bash'" -Verb Runas
else
  bash /tmp/tmp_link.bash
fi
while [ ! -e /tmp/tmp_link.lock ]; do :;done
rm -f /tmp/tmp_link.lock
rm -f /tmp/tmp_link.bash
