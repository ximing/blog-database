#!/bin/bash
git clone git@github.com:yeanzhi/blog-bone.git .bone
node ./deploy/mv-posts.js
cd .bone
hexo generate
hexo deploy
cd ..

