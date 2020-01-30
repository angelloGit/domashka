#!/bin/sh

git init
git remote add repo2 https://angelloGit:92c592363ba23c22c56e0bec2d3549a995fe090d@github.com/angelloGit/prod-repa-2
git fetch repo2 
git branch -r --merged  `git rev-parse repo2/master` | grep -v  -P '^\s*repo2/(master|dev|release)' | sed 's@repo2/@@ '| xargs -L 1 git push repo2 --delete 

  


