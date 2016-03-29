#!/bin/sh
# Append new utility to Perl installation
from="/usr/share/perl/cygwin-pods/grepmail.pod"
to="/usr/lib/perl5/5.8/cygwin/perllocal.pod"
cat "$from" >> "$to"
#:etc
fromdir=/etc/defaults
for i in  etc/
do
    from="$fromdir/$i"
    to="$dest/$i"

    [ -e "$from" ] || continue
    [ -e "$to"   ] && continue

    case "$i" in
        */) # Directory
            install -d -m 755 "$to"
            ;;
        *)  # File
            install -v -m 644 "$from" "$to"
            ;;
    esac
done

