#!/bin/sh

#. term.sh -x java -jar selenium-server-standalone-2.43.1.jar -role hub;
#sleep 5s;
#
#. term.sh -x java -jar selenium-server-standalone-2.43.1.jar -role node -hub http://localhost:4444/grid/register --no-sandbox -maxSession 10 -browser browserName=firefox,maxInstances=5,platform=MAC;
#. term.sh -x java -jar selenium-server-standalone-2.43.1.jar -role node -hub http://localhost:4444/grid/register --no-sandbox -maxSession 10 -Dwebdriver.chrome.driver="chromedriver" -browser browserName=chrome,maxInstances=5,platform=MAC;
#. term.sh -x java -jar selenium-server-standalone-2.43.1.jar -role node -hub http://localhost:4444/grid/register --no-sandbox -maxSession 10 -Dwebdriver.safari.driver="safaridriver" -browser browserName=safari,maxInstances=5,platform=MAC;

. term.sh -x java -jar selendroid-standalone-0.12.0-with-dependencies.jar -app selendroid-test-app-0.12.0.apk -port 5555
sleep 10s;
. term.sh -x java -Dfile.encoding=UTF-8 -cp "selendroid-grid-plugin-0.12.0.jar:selenium-server-standalone-2.43.1.jar" org.opqa.grid.selenium.GridLauncher -capabilityMatcher io.selendroid.grid.SelendroidCapabilityMatcher -role hub -host 127.0.0.1 -port 4444
sleep 5s;
. term.sh -x curl -H "Content-Type: application/json" -X POST --data @/Users/oliver/projects/regression-tests/src/test/java/com/common/grid/selendroid-nodes-config.json http://localhost:4444/griregister
sleep 5s;