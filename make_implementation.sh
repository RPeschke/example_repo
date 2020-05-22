#/bin/bash
#$1 ... Entity name
#$2 ... UCF File
#$3 ... coregen folder (optional)

echo "make ISE build system for $1"
mkdir ./protoBuild//$1/
cp "protoBuild//proto_Project.in"   "./build/$1/"
mv "./build/$1/proto_Project.in"  "./build/$1/$1_proto_Project.in"
python3 vhdl_build_system//bin_make_implementation.py $1 $2
cp "protoBuild//simpleTemplate.xise.in"   "./build/$1/"
mv "./build/$1/simpleTemplate.xise.in"  "./build/$1/$1_simpleTemplate.xise.in"
python3  makeise//makeise.py "build/$1/$1.in" "build/$1/$1.xise"
if [ "$3" != "" ]; then
  cp -rf $3 ./build/$1/coregen/
fi
    