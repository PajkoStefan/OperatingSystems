#!/bin/bash

site=`find ~ -type f -exec grep  "#!/usr/bin/perl" '{}' \; -print`
echo $site
