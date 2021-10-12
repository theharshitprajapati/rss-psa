#https://gist.githubusercontent.com/ecentinela/199670/raw/7fdb39cbfc2890820c8e8ef64e1184716a24f1cc/Change%2520author%2520details%2520in%2520
# Change author details in all old commits.
# WARNING: Will change all your commit SHA1s.
#!/bin/sh
 
git filter-branch --env-filter '
 
an="$GIT_AUTHOR_NAME"
am="$GIT_AUTHOR_EMAIL"
cn="$GIT_COMMITTER_NAME"
cm="$GIT_COMMITTER_EMAIL"
 
if [ "$GIT_COMMITTER_EMAIL" = "85573154+dumble555@users.noreply.github.com" ]
then
cn="Snape"
fi
export GIT_COMMITTER_NAME=$cn
'

# after this, push the repository
# git push origin master --force

# if something goes wrong, remove the last commit
# git push -f origin HEAD^:master
