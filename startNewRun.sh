runNr="RUN_$(date '+%Y-%m-%d-%H-%M')"
echo $runNr > nextRunFolder.txt
git add *
git commit -m "$runNr"
