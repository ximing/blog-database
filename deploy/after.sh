#!/bin/bash
git clone git@github.com:yeanzhi/blog-bone.git .bone
node mv-posts.js
cd .bone
hexo generate
hexo deploy
