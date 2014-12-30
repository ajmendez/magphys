#!/bin/bash
# Parallized using parrel

# Set total number of observations to show in process monitor
n=`wc -l $USER_OBS | awk '{print $1}'`
echo "Running N=$n Magphys Fits"

seq $n | parallel --pipe -N 1 -n 1 -j 10 --delay 0.1 --progress \
	 --halt 2 --ungroup \
	 bin/fit_sed {#}

echo "Parallel Finished with Status: $?"

# the log is not populated on the JHU machines for some reason
# cat ./fit_sed.log


#usr/local/bin/tcsh
# set file=$USER_OBS
#
# set n=`wc -l $file | awk '{print $1}'`
# echo $n
#
# set i = 1
# while ($i < $n )
# 	echo $i | xargs -n 1 | ./fit_sed
# 	@ i = $i + 1
# end