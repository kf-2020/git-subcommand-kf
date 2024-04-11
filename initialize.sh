#!/bin/bash

PRJ_DIR_NAME="git-subcommand-kf"
SHELL_NAME=$(basename $SHELL)

if [ "$SHELL_NAME" = "bash" ]; then
    # bash_profile新規作成時もしくはbash_profileにすでにパス登録されていない場合のみ、当ディレクトリをパス登録
    if [ ! -e ~/.bash_profile ] || ! grep -q "$PRJ_DIR_NAME" ~/.bash_profile ; then
        echo "" >> ~/.bash_profile
        echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.bash_profile
    fi
elif [ "$SHELL_NAME" = "zsh" ]; then
    # zshrc新規作成時もしくはzshrcにすでにパス登録されていない場合のみ、当ディレクトリをパス登録
    if [ ! -e ~/.zshrc ] ||  ! grep -q "$PRJ_DIR_NAME" ~/.zshrc ; then
        echo "" >> ~/.zshrc
        echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.zshrc
    fi
fi

# 配下のサブコマンドファイルに実行権限付与
chmod 755 ./git-*
