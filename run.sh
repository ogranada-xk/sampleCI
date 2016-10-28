#!/bin/bash

# function to kill browser sync instances.
function killBS {
    ps -Af | grep browser-sync | grep -v grep | awk '{print $2}' | xargs kill
}

# Call kill method
killBS
npm run start > /tmp/out.log 2> /tmp/err.log &
sleep 5 && ./node_modules/.bin/chimp --browser=phantomjs
killBS

exit $?
