#/bin/bash
#$1 entity Name
#$2 Input File Name
#$3 Ouput File name
#$4 IP Address
#$5 Port



if [ "$3" != "" ]; then
    rm -f  $3
fi

if [ "$2" != "" ]; then
    python3 vhdl_build_system/excel_to_csv.py --OutputCSV  build/$1/$1.csv  --InputXLS $2 
fi

IpAddress="192.168.1.20"
if [ "$4" != "" ]; then
    IpAddress="$4"
fi

port="2000"
if [ "$5" != "" ]; then
    port="$5"
fi

dos2unix firmware-ethernet/scripts/udp_run.py
scp firmware-ethernet/scripts/udp_run.py labpc:/home/belle2/Documents/tmp//

scp build/$1/$1.csv labpc:/home/belle2/Documents/tmp//



echo  "cd /home/belle2/Documents/tmp// && ./udp_run.py --InputFile $1.csv --OutputFile $1_out_HW.csv --IpAddress $IpAddress --port $port --OutputHeader $1_header.txt"
ssh labpc "cd /home/belle2/Documents/tmp// && ./udp_run.py --InputFile $1.csv --OutputFile $1_out_HW.csv --IpAddress $IpAddress --port $port --OutputHeader $1_header.txt"


scp  labpc:/home/belle2/Documents/tmp//$1_out_HW.csv  build/$1/





if [ "$3" != "" ]; then
    cp -f build/$1/$1_out_HW.csv $3
fi


FolderName=$(cat "currentFolder.txt")
echo $FolderName
ssh labpc "cd  /home/belle2/Documents/tmp// && cp  $1.csv  $FolderName/$(date '+%Y-%m-%d-%H-%M')_$1.csv  && cp  $1_out_HW.csv $FolderName/$(date '+%Y-%m-%d-%H-%M')_$1_out_HW.csv"

    