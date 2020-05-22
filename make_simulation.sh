#/bin/bash
echo "make ISIM build system for '$1'"


# $1 : Test Bench Name
python3 vhdl_build_system//bin_make_simulation.py  "$1"
