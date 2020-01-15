#!/bin/bash

sdir=$HOME/Pictures/screenshots
tstmp=$(date +'%F_%H%M%S_%N')
mkdir -p $sdir

import $sdir/$tstmp\.png;
eog $sdir/$tstmp\.png;



