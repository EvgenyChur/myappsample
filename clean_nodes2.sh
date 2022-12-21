#!/bin/bash 

#-------------------------------------------------------------------------------
# Clean nodes before run OCN model:
#
# Current code owner:
#
#  Max Planck Institute for Biogeochemistry
#
# Authors:
#
#   MPI-BGC, 2022
#   Evgenii Churiulin, Ana Bastos
#   phone:  +49 170-261-51-04
#   email:  evchur@bgc-jena.mpg.de
#
#-------------------------------------------------------------------------------

# Before you run the script you have to change:
# 1. mypassword to your actual password
# 2. path2mydata to your (for example: /scratch/evchur/*)
# all changes have to be done in line 35

# List of nodes
servers=("node-r5-he17" "node-r5-he18" "node-r5-he19" "node-r5-he20" "node-r5-he21" \
         "node-r5-he22" "node-r5-he23" "node-r5-he23" "node-r5-he24" "node-r5-he25" \
         "node-r5-he26" "node-r5-he27" "node-r5-he28" "node-r5-he29" "node-r5-he30" \
         "node-r5-he31" "node-r5-he32" "node-r5-he33" "node-r5-he34" "node-r5-he35" \
         "node-r5-he36" "node-r5-he37" "node-r5-he38" "node-r5-he39" "node-r6-he31" \
         "node-r5-he32" "node-r5-he33" "node-r5-he34" "node-r5-he35"                )
scount=23

#============================= Main part =======================================
for (( i=0; i<=scount ; i++ ));
do
    expect -c 'spawn ssh '${servers[${i}]}' "rm -rf /scratch/evchur/*"; expect "assword:"; send "mypass\r"; interact'
done