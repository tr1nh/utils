#!/bin/bash

wget https://github.com/tr1nh/dotfiles/archive/refs/heads/master.tar.gz -O - | tar xz
cd dotfiles-master/
ls -a | grep -v README | xargs -i{} cp -r {} ~/
cd ..
rm -rf dotfiles-master/
