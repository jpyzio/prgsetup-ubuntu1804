#!/usr/bin/env bash

progress "Jetbrains toolbar";

CURRENT_DIR=$(dirname "$0");

URLDATA=`curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"`;

LASTEST_URL=`printf %s "${URLDATA}" | jq '.TBA[0].downloads.linux.link' | tr -d '"'`;
LASTEST_BUILD=`printf %s "${URLDATA}" | jq '.TBA[0].build' | tr -d '"'`;

wget -O ${CURRENT_DIR}/toolbox.tgz ${LASTEST_URL};

tar xzf ${CURRENT_DIR}/toolbox.tgz;


jetbrains-toolbox-${LASTEST_BUILD}/jetbrains-toolbox;

message "Accept license and close Toolbox window";

rm ${CURRENT_DIR}/toolbox.tgz;
rm -Rf jetbrains-toolbox-${LASTEST_BUILD};
