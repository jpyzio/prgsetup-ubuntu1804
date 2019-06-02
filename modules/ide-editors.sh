#!/usr/bin/env bash

sudo apt update


### BEGIN Atom
ATOM_FILE="${ROOT_DIR}/atom.deb"

wget --output-document=${ATOM_FILE} https://atom.io/download/deb
sudo gdebi -n ${ATOM_FILE}

rm ${ATOM_FILE}
### END Atom


### END Sublime Text 3
wget --quiet -O - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo apt install --yes sublime-text
### END Sublime Text 3


### BEGIN Toolbox
RELEASE_JSON=`curl -s "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"`
LASTEST_URL=`printf %s "${RELEASE_JSON}" | jq '.TBA[0].downloads.linux.link' | tr -d '"'`
LASTEST_BUILD=`printf %s "${RELEASE_JSON}" | jq '.TBA[0].build' | tr -d '"'`
TOOLBOX_FILE="${ROOT_DIR}/toolbox.tgz"

wget --output-document=${TOOLBOX_FILE} ${LASTEST_URL}
tar xzf ${TOOLBOX_FILE}

jetbrains-toolbox-${LASTEST_BUILD}/jetbrains-toolbox

rm ${TOOLBOX_FILE}
rm --recursive --force jetbrains-toolbox-${LASTEST_BUILD}
### END Toolbox


### BEGIN Tuning system for Jetbrain's apps
echo "fs.inotify.max_user_watches = 524288" | sudo tee --append /etc/sysctl.conf
sudo sysctl -p --system
### END Tuning system for Jetbrain's apps
