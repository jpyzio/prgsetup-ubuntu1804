#!/usr/bin/env bash

echo "[Progress] Install Jetbrains Toolbox";

CURRENT_DIR=$(dirname "$0");

URLDATA=`curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"`;

LASTEST_URL=`printf %s "${URLDATA}" | jq '.TBA[0].downloads.linux.link'`;
LASTEST_URL=${LASTEST_URL:gs/\"/};

LASTEST_BUILD=`printf %s "${URLDATA}" | jq '.TBA[0].build'`;
LASTEST_BUILD=${LASTEST_BUILD:gs/\"/};

wget -q -O toolbox.tgz ${LASTEST_URL};

tar xzf toolbox.tgz;

mv jetbrains-toolbox-${LASTEST_BUILD}/jetbrains-toolbox ${CURRENT_DIR}/../bin/;

rm toolbox.tgz;
rmdir jetbrains-toolbox-${LASTEST_BUILD};

${CURRENT_DIR}/../bin/toolbox;
