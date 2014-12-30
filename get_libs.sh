#!/bin/bash
# Parallelized library builder.

echo "Building Optical Libs"
cat zlibs.dat | awk '{print $2 "\n 70.,0.30,0.70"}' \
	| parallel --pipe -n 2 -j 10 --progress \
		--joblog ./optic.log --resume --resume-failed \
		--halt 2 --ungroup \
		./get_optic_colors "{#}"

optical_status="$?"

echo "Building IR Libs"
cat zlibs.dat | awk '{print $2 "\n 70.,0.30,0.70"}' \
	| parallel --pipe -n 2 -j 10 --progress \
		--joblog ./ir.log --resume --resume-failed \
		--halt 2 --ungroup \
		./get_infrared_colors "{#}"

ir_status="$?"


echo '------'
echo "Optical: $optical_status; IR: $ir_status"
echo 'Done!'
echo '------'




# #! usr/local/bin/tcsh
# set file='zlibs.dat'
#
# foreach line (`awk ' {print $1";"$2}' $file`)
#
#    set z=`echo $line | awk 'BEGIN {FS=";"} {print $2}'`
#
#    echo $z "70.,0.30,0.70" | xargs -n 1 | ./get_optic_colors
#
#    echo $z "70.,0.30,0.70" | xargs -n 1 | ./get_infrared_colors
#
# end
