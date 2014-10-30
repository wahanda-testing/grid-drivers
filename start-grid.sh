#!/bin/sh
if [ $(ps aux | grep 'selenium-server-standalone-2.43.1.jar -role hub' | grep -v grep | wc -l | tr -s "\n") -eq 0 ];
then . term.sh -x java -jar selenium-server-standalone-2.43.1.jar -role hub;
sleep 5s;
fi

if [ $(ps aux | grep 'selenium-server-standalone-2.43.1.jar -role node' | grep -v grep | wc -l | tr -s "\n") -eq 0 ];
then . term.sh -x java -jar selenium-server-standalone-2.43.1.jar -role node -Dwebdriver.chrome.driver="chromedriver" -hub http://localhost:4444/grid/register --no-sandbox -maxSession 10 -browser browserName=firefox,maxInstances=5,platform=MAC -browser browserName=chrome,maxInstances=5,platform=MAC;
sleep 10s;
fi