#!/bin/sh

tpl /opt/whalesome/packages/cli/zsh/.zshrc.tpl \
  userName=nginx > $HOME/.zshrc
