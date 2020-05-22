#/bin/bash
echo "running $1"

# $1 : Test Bench Name
# $2 : Input csv File name
# $3 : output csv File Name

if [ "$3" != "" ]; then
    rm -f  $3
fi

python3 vhdl_build_system/excel_to_csv.py --OutputCSV  "$2.csv"  --InputXLS $2 

ssh xilinx "cd /home/ise/xilinx_share2/GitHub/example_repo && ./build/$1/run.sh $2.csv $3"

