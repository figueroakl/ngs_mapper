#!/bin/bash

# Ya, pretty ugly
CPUS=$(for pid in $(awk '/physical id/ {print $4}' /proc/cpuinfo | sort | uniq); do egrep -xA 12 "processor[[:space:]]: $pid" /proc/cpuinfo; done | awk '/cpu cores/ {print $4}' | paste -sd+ | bc)

for p in Projects/*
do
    if [ "$1" == "-norecreate" ]
    then
        echo /usr/bin/time miseqpipeline/graphsample.py ${p}/$(basename $p).bam -od $p -qualdepth ${p}/$(basename $p).bam.qualdepth.json
    else
        echo /usr/bin/time miseqpipeline/graphsample.py ${p}/$(basename $p).bam -od $p
    fi
done | xargs -n 5 -P $CPUS -I CMD bash -c CMD

miseqpipeline/graph_mapunmap.py Projects/*/*.qualdepth.json -o MapUnmapReads.png
convert -quality 25 -compress JPEG Projects/*/*.png QualDepth.pdf