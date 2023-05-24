#!/bin/bash

########################################
# スクリプトの最初にsudoでroot権限を取得
########################################
if [ "$EUID" -ne 0 ]; then
  sudo "$0" "$@"  # スクリプト自体をsudoで再実行
  exit            # 以降の処理はrootユーザで実行されるため、ここで終了
fi

########################################
# dircolors
########################################
cp setup_dircolors.txt /home/$(getent passwd 1000 | cut -d: -f1)/.dircolors
chown $(getent passwd 1000 | cut -d: -f1):$(getent group 1000 | cut -d: -f1) /home/$(getent passwd 1000 | cut -d: -f1)/.dircolors
chmod 600 /home/$(getent passwd 1000 | cut -d: -f1)/.dircolors

cp setup_dircolors.txt /root/.dircolors
chmod 600 /root/.dircolors

