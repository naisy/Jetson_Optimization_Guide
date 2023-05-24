#!/bin/bash

########################################
# スクリプトの最初にsudoでroot権限を取得
########################################
if [ "$EUID" -ne 0 ]; then
  sudo "$0" "$@"  # スクリプト自体をsudoで再実行
  exit            # 以降の処理はrootユーザで実行されるため、ここで終了
fi

########################################
# .bashrc (login/root)
########################################
# sed
# escape characters \'$.*/[]^
# 1. Write the regex between single quotes.
# 2. \ -> \\
# 3. ' -> '\''
# 4. Put a backslash before $.*/[]^ and only those characters.

####################
# disable_problem_report
####################
#-    enabled=1
#+    enabled=0
sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

