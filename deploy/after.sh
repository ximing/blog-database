#!/bin/bash
rm -rf .bone
git clone git@github.com:yeanzhi/blog-bone.git .bone
node ./deploy/mv-posts.js
cd .bone
#git clone https://github.com/litten/hexo-theme-yilia.git themes/hexo-theme-yilia
git clone https://github.com/iissnan/hexo-theme-next themes/next
npm install
hexo generate
hexo deploy
rsync -av ./public/ -e 'ssh -o StrictHostKeyChecking=no' --progress  root@114.215.142.175:/usr/local/openresty/nginx/html/blog
cd ..
