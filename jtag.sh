#/bin/bash
#$1 entity Name

echo " build/$1/$1.bit"
ls  build/$1/$1.bit
scp  build/$1/$1.bit lab_xilinx:/home/ise//

echo "setMode -bscan" > commad.cmd
echo "setCable -port auto" >> commad.cmd
echo "Identify -inferir"  >> commad.cmd
echo "identifyMPM"  >> commad.cmd
echo "assignFile -p 1 -file "$1.bit""  >> commad.cmd
echo "Program -p 1" >> commad.cmd
echo "quit"  >> commad.cmd

scp commad.cmd lab_xilinx:/home/ise//
ssh lab_xilinx "impact -batch commad.cmd"
rm commad.cmd

FolderName=$(cat "nextRunFolder.txt")
newFolder="/home/belle2/Documents/tmp//$FolderName"

ssh labpc "mkdir $newFolder"
ssh labpc "echo start > $newFolder/$(date '+%Y-%m-%d-%H-%M')_start.txt"
scp build/$1/$1.bit "labpc:$newFolder"
ssh labpc "mv $newFolder/$1.bit $newFolder/$(date '+%Y-%m-%d-%H-%M')_$1.bit"
scp "build/$1/$1_header.txt" "labpc:/home/belle2/Documents/tmp//"
echo  $FolderName > currentFolder.txt
