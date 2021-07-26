#!/bin/sh

rm vulnerability.txt
while read line; do
        WORDNUM=0
        for word in $line; do
                if (( $WORDNUM == 0 ))
                        then
                                PACKAGE=$word
                        else
                                WORDNUM=$WORDNUM
                fi
                if (( $WORDNUM == 1 ))
                        then
                                VERSION=$word
                        else
                                WORDNUM=$WORDNUM
                fi
                if (( $WORDNUM == 2 ))
                        then
                                ECOSYSTEM=$word
                        else
                                WORDNUM=$WORDNUM
                fi
                WORDNUM="$((WORDNUM+1))"
                #echo $PACKAGE
                #echo $VERSION
                #echo $ECOSYSTEM
                #echo $WORDNUM
        done
		 #echo $PACKAGE
        #echo $VERSION
        #echo $ECOSYSTEM
        curl -XPOST https://vcurator-ykt.gitsecure-api.com/v1/vcurator/search -d '[{"package_name":"'"$PACKAGE"'","package_version":"'"$VERSION"'","ecosystem":"'"$ECOSYSTEM"'"}]' -k >> vulnerability.txt
done <"sbom-new.txt"
