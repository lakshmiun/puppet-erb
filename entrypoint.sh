#!/bin/bash -x

set -euo pipefail

if [[ "$#" -eq "0" ]]; then
	# No arguments given, run the syntax checker on every Puppet manifest in the current directory
  /opt/puppetlabs/puppet/bin/erb -P -x -T '-' "$1" |  xargs -0 /opt/puppetlabs/puppet/bin/ruby -c
else
	# Run the syntax checker on the given files / directories
	exec /opt/puppetlabs/puppet/bin/ruby -c "$@"
fi
