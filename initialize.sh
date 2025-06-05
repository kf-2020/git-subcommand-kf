#!/bin/bash

PRJ_DIR_NAME="git-subcommand-kf"
SHELL_NAME=$(basename $SHELL)

function path_through_bash() {
    if [ "$SHELL_NAME" = "bash" ]; then
        # bash_profile新規作成時もしくはbash_profileにすでにパス登録されていない場合のみ、当ディレクトリをパス登録
        if [ ! -e ~/.bash_profile ] || ! grep -q "$PRJ_DIR_NAME" ~/.bash_profile ; then
            echo "" >> ~/.bash_profile
            echo "export PATH=\"\$PATH:$(cd $(dirname $0);pwd)\"" >> ~/.bash_profile
        fi
    elif [ "$SHELL_NAME" = "zsh" ]; then
        # zshrc新規作成時もしくはzshrcにすでにパス登録されていない場合のみ、当ディレクトリをパス登録
        if [ ! -e ~/.zshrc ] ||  ! grep -q "$PRJ_DIR_NAME" ~/.zshrc ; then
            echo "" >> ~/.zshrc
            echo "export PATH=\"\$PATH:$(cd $(dirname $0);pwd)\"" >> ~/.zshrc
        fi
    fi
}

function make_env() {
    if [ ! -e "./.env" ]; then
        cp "./.env.sample" "./.env"
        setting_env
    fi
}

function setting_env() {
    if [ -e "./.env" ]; then
        # プロジェクト毎で .env の書き換えロジックをここに入れる
        :
    fi
}

cd "$(dirname ${0})"

path_through_bash \
&& make_env \
&& echo " *-*-*-*- 初期構築完了. -*-*-*-* " \
&& echo " 試しに以下コマンドを叩き、ブランチの一覧が表示されることを確認しましょう。 " \
&& echo "   git b "
