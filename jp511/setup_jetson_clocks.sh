#!/bin/bash

########################################
# スクリプトの最初にsudoでroot権限を取得
########################################
if [ "$EUID" -ne 0 ]; then
  sudo "$0" "$@"  # スクリプト自体をsudoで再実行
  exit            # 以降の処理はrootユーザで実行されるため、ここで終了
fi

########################################
# jetson_clocks
########################################
cp jetson_clocks.service /etc/systemd/system/jetson_clocks.service

systemctl daemon reload
systemctl enable jetson_clocks.service
