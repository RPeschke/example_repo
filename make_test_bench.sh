#/bin/bash
echo "make test bench for '$1' in Folder '$2' "

mkdir $2

python3 vhdl_build_system//bin_make_test_bench.py  --EntityName $1 --OutputPath $2
