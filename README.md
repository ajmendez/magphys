magphys
=======

This is not my work, just a repository to keep track of my changes to the magphys codebase


Quick Start
-----------


    * source .magphys_bashrc                 # make sure this matches your system
    * cd $MAGPHYS/src && make && cd ..
    * ./get_zlibs.sh                         # build the redshift grid
    * ./get_libs.sh                          # build the optical and IR libraries
    * ./fit_sample.sh                        # fit the libs to the sample
    * # [then it is off to the land of python]