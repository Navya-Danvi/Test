#!/bin/bash

if [ -f "fruitbasket" ] ; then
  sed -i 's/Apple/PineApple/' fruitbasket
  echo "File replaced successfully"
else
 echo "File Not Found"
fi
