#!/usr/bin/env bash

RELEASE_JSON=`curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"`

LASTEST_URL=`printf %s "${RELEASE_JSON}" | jq '.TBA[0].downloads.linux.link' | tr -d '"'`
LASTEST_BUILD=`printf %s "${RELEASE_JSON}" | jq '.TBA[0].build' | tr -d '"'`

TOOLBOX_FILE="${ROOT_DIR}/toolbox.tgz"

wget --output-document=${TOOLBOX_FILE} ${LASTEST_URL}

tar xzf ${TOOLBOX_FILE}

jetbrains-toolbox-${LASTEST_BUILD}/jetbrains-toolbox

rm ${TOOLBOX_FILE}
rm --recursive --force jetbrains-toolbox-${LASTEST_BUILD}

echo "fs.inotify.max_user_watches = 524288" | sudo tee --append /etc/sysctl.conf
sudo sysctl -p --system
