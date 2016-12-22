#!/bin/bash
rm -rf .bone
git clone git@github.com:yeanzhi/blog-bone.git .bone
node ./deploy/mv-posts.js
cd .bone
#git clone https://github.com/litten/hexo-theme-yilia.git themes/hexo-theme-yilia
npm install
hexo generate
hexo deploy
cd ..

