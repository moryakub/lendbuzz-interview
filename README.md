# What's included
1. Added Dockerfile, healthcheck included
2. Github actions to build an updated image and publish it to JFrog artifactory
3. `run_with_db.sh` script to run the latest version published on the artifactory together with a postgres db

# How to run
1. make sure to add the jfrog_token.txt file to this directory as it contains the jfrog auth token for the script
2. just run `sh run_with_db.sh`

