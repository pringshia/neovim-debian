#! /bin/bash   
set -m

nvim --headless --noplugin -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
