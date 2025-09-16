#!/bin/bash
####################################
# All rights reserved.              #
# started from Zero                 #
# HomelabARR Containers              #
# Maintainer smashingtags            #
#####################################
#####################################
# MIT LICENSE                       #
# CUSTOMIZING IS ALLOWED             #
# REBRANDING IS ALLOWED              #
# CODE MIRRORING IS ALLOWED          #
#####################################
# shellcheck disable=SC2086
# shellcheck disable=SC2046

export username=${username}
export token=${token}

folder=$(ls -1p ./ | grep '/$' | sed 's/\/$//' | sed '/docs/d' |sed '/images/d' | sed '/dead/d' )

for i in ${folder[@]}; do
   find ./$i -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | sort | while read app; do
      if test -f "./.templates/$i/${app}.sh"; then
         echo "$i" "${app}" && sleep 1
         bash "./.templates/$i/${app}.sh" "$i" "${app}" "$username" "$token"
      fi
   done
done

folder=$(ls -1p ./ | grep '/$' | sed 's/\/$//' | sed '/docs/d' | sed '/dead/d' | sed '/images/d' )
for i in ${folder[@]}; do
   find ./$i -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | sort | while read app; do
     ## hardcoded files inside
     if [ -d "./$i/${app}/root/" ] && [ ! -f "./$i/${app}/root/homelabarr.txt" ]; then
        if [ -f "./.templates/ci/homelabarr.txt" ]; then
           cp -r "./.templates/ci/homelabarr.txt" "./$i/${app}/root/homelabarr.txt"
        fi
     fi
     unset app
   done
done

unset token username

## add container.json
rm -f ./container.json ./wiki/docs/install/container.json 2>/dev/null || true

# Ensure wiki directory exists
mkdir -p ./wiki/docs/install

folder=$(ls -1p ./ | grep '/$' | sed 's/\/$//' | sed '/docs/d' | sed '/dead/d' | sed '/images/d' )
for i in ${folder[@]}; do
   find ./$i -maxdepth 1 -mindepth 1 -type d -exec basename {} \; | sort | while read app; do
      if test -f "./$i/${app}/release.json"; then
         ## FOR METRICS
         echo "$i" "${app}" >> container.json && \
         cat "./$i/${app}/release.json" >> container.json && \
         echo "" >> container.json
         ## FOR HOMELABARR
         cat "./$i/${app}/release.json" >> ./wiki/docs/install/container.json
      fi
   done
done

#### END FILE ####

sleep 2

# Log what was processed
echo "Version update script completed successfully"
echo "Files updated:"
if [ -f "./container.json" ]; then
   echo "- container.json ($(wc -l < ./container.json) lines)"
fi
if [ -f "./wiki/docs/install/container.json" ]; then
   echo "- wiki/docs/install/container.json ($(wc -l < ./wiki/docs/install/container.json) lines)"
fi

# Let the workflow handle git operations
exit 0
