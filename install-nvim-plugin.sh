#!/bin/bash

if [ -x "$(command -v nvim)" ]; then
  echo "Neovim is not installed. Please install neovim first."
  exit 1
fi

mkdir -p ~/.local/share/nvim/site/pack/coc/start
cd ~/.local/share/nvim/site/pack/coc/start
git clone --branch release https://github.com/neoclide/coc.nvim.git --depth=1
nvim -c "CocInstall coc-git coc-sh coc-pyright coc-html coc-css coc-tsserver coc-json coc-emmet coc-prettier"

mkdir -p ~/.local/share/nvim/site/pack/bundle/start
cd ~/.local/share/nvim/site/pack/bundle/start
git clone --depth=1 https://github.com/mg979/vim-visual-multi.git
git clone --depth=1 https://github.com/github/copilot.vim.git
