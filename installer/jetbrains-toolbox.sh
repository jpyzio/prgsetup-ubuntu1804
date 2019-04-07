#!/usr/bin/env bash

progress "Jetbrains toolbar"

URLDATA=`curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"`

LASTEST_URL=`printf %s "${URLDATA}" | jq '.TBA[0].downloads.linux.link' | tr -d '"'`
LASTEST_BUILD=`printf %s "${URLDATA}" | jq '.TBA[0].build' | tr -d '"'`

TOOLBOX_FILE="${ROOT_DIR}/toolbox.tgz"

wget -O ${TOOLBOX_FILE} ${LASTEST_URL}

tar xzf ${TOOLBOX_FILE}


jetbrains-toolbox-${LASTEST_BUILD}/jetbrains-toolbox

message "Accept license and close Toolbox window"

rm ${TOOLBOX_FILE}
rm -Rf jetbrains-toolbox-${LASTEST_BUILD}
