#/bin/bash
echo "build_syntesize $1"
# $1 : Test Bench Name
ssh xilinx "cd /home/ise/xilinx_share2/GitHub/example_repo/build/$1/ && ./build_syntesize.sh "
    