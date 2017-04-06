#!/usr/bin/env bash
# Thanks to https://github.com/edouard-lopez/progress-bar.sh for the good looking progress bar
progress-bar() {
  local duration=${1}

  already_done() { for ((done=0; done<elapsed; done=done+1)); do printf "▇"; done }
  remaining() { for ((remain=elapsed; remain<duration; remain=remain+1)); do printf " "; done }
  percentage() { printf "| %s%%" $(( (elapsed*100)/(duration*100)/100 )); }
  clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=duration; elapsed=elapsed+1 )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

## Route #1
echo "Trying the root location with a get "
progress-bar 4
curl --request GET --url http://localhost:4567/  --verbose

echo "\n\n"

## Route #2
echo "POSTing data  with secret message  - Meet me at Coffee Shop"
progress-bar 4
curl --request POST --url 'http://localhost:4567/secret?message=meet%20me%20at%20Coffee%20shop' --verbose

echo "\n\n"

## Route #3
echo "Route with named parameters -  Sending message to Room 42 "
progress-bar 4
curl --request GET --url http://localhost:4567/send/42/

echo "\n\n"

## Route #4
echo "Blender Route - Mixing Apples with oranges"
progress-bar 4
curl --request GET --url http://localhost:4567/mix/apple/with/oranges/ 
