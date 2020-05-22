#/bin/bash
echo "Runing test case  '$1'"
# $1 : Test Case File
if [ "$1" != "" ]; then
  python3 vhdl_build_system//bin_run_test_case.py --test $1 --update True 
else
  python3 vhdl_build_system//bin_run_test_case.py --update True 
fi
