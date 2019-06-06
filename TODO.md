node 12
3. readme
6. review
7. sprawdzić zależności użyte w pliku i doinstalować

Scenariusze testowe:
z wypełnionym config
bez wypełnionego config
#Install fail2ban for openssh server

PermitRootLogin no
ChallengeResponseAuthentication no
PubkeyAuthentication yes
PermitEmptyPasswords no
ClientAliveInterval 600
ClientAliveCountMax 1
X11Forwarding no
Banner /etc/issue
IgnoreRhosts yes
HostbasedAuthentication no
PasswordAuthentication no
UsePAM no


if [[ $(command -v yarn) ]]; then
    yarn global upgrade
fi

if [[ $(command -v composer) ]]; then
    sudo composer self-update
    composer global update
fi
