#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/student/ml634/2015/samples/mmult/_sds/vhls/mmult/solution/.autopilot/db/a.g.bc ${1+"$@"}