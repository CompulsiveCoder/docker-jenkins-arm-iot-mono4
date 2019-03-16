#!/bin/bash

BRANCH=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')

if [ "$BRANCH" = "dev" ]
then
  echo "Forcing remote build"

  echo " " >> Jenkinsfile
  
  git pull origin dev && \
  git commit Jenkinsfile -m "Forcing rebuild" && \
  git push origin dev && \
  
  echo "Repository has been updated. Build should now start on build server."
else
  echo "Cannot force rebuild from master branch. Switch to dev branch first."
fi
