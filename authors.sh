#!/usr/bin/env bash

set -e

SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOTDIR="$(git -C "$SCRIPTDIR" rev-parse --show-toplevel)"

set -x

# see also ".mailmap" for how email addresses and names are deduplicated
cat > "${ROOTDIR}/AUTHORS" <<- EOF
	# File @generated by sorting_algorithms/authors.sh. DO NOT EDIT.
	# This file lists all contributors to the repository.
	# See sorting_algorithms/authors.sh to make modifications.

	$(git -C "$ROOTDIR" log --format='%aN <%aE>' | LC_ALL=C.UTF-8 sort -uf)
EOF
