#!/bin/bash

SHELL_NAME=$(basename $SHELL)
if [ "$SHELL_NAME" = "bash" ]; then
    echo "" >> ~/.bash_profile
    echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.bash_profile
elif [ "$SHELL_NAME" = "zsh" ]; then
    echo "" >> ~/.zshrc
    echo "export PATH=\"\$PATH:$(pwd)\"" >> ~/.zshrc
fi

# は以下ファイルに実行権限付与
chmod 755 ./*
