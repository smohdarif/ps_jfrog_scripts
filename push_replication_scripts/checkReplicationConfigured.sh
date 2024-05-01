#! /bin/bash

# JFrog hereby grants you a non-exclusive, non-transferable, non-distributable right to use this  code   solely in connection with your use of a JFrog product or service. This  code is provided 'as-is' and without any warranties or conditions, either express or implied including, without limitation, any warranties or conditions of title, non-infringement, merchantability or fitness for a particular cause. Nothing herein shall convey to you any right or title in the code, other than for the limited use right set forth herein. For the purposes hereof "you" shall mean you as an individual as well as the organization on behalf of which you are using the software and the JFrog product or service.

SOURCE_JPD_URL="${1:?please enter JPD URL. ex - https://ramkannan.jfrog.io}"
USER_NAME="${2:?please provide the username in JPD . ex - admin}"
JPD_AUTH_TOKEN="${3:?please provide the identity token}"

jf rt curl "api/repositories?type=local" -s --server-id=psinaz | jq -r '.[].key' > "repos_list_local.txt"

echo -e "\n"

echo "" > replicationrepo.csv

while IFS= read -r reponame; do
    data=$(curl -XGET -u $USER_NAME:$JPD_AUTH_TOKEN $SOURCE_JPD_URL/artifactory/api/replications/$reponame -s | grep message | xargs)
    if [[ $data == *"message"*  ]]; then
        echo "No Replication Configured for $reponame"
        echo "1,$reponame,no" >> replicationrepo.csv
    else
        echo "replication configured for ==> $reponame"
        echo "1,$reponame,yes" >> replicationrepo.csv
    fi
done < "repos_list_local.txt"

### sample cmd to run - ./checkReplicationConfigured.sh https://ramkannan.jfrog.io admin ****
