#!/bin/bash

set -eu

# setup passwordless sudo
echo "parasite         ALL = (ALL) NOPASSWD: ALL" > /etc/sudoers.d/parasite
chmod 0440 /etc/sudoers.d/parasite