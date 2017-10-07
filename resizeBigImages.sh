#!/bin/bash





#################################################
#						#
#	Will simply resize only the images	#
#	that are bigger than 1000x1000		#
#						#
#################################################






fileList=`find . \( -name '*.jpg' -o -name '*.png' -o -name '*.gif' \)`


for currentFile in $fileList; do

    imageSize=`identify $currentFile | cut -d' ' -f3`

    width=`echo $imageSize | cut -d'x' -f1`
    height=`echo $imageSize | cut -d'x' -f2`

    if [ $width -gt 1000 ]
    then
	convert $currentFile -resize 1000x1000\>  $currentFile
        echo Resized : $currentFile
    fi

    

done
