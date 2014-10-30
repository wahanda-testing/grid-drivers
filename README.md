----- Steps to set-up grid -----

1. Create an emulator if one doesn't exist and start and stop it
android avd

2. Assuming you cloned in ~/projecrs navigate to ~/projects/grid-drivers/

3. Start selendroid server - See selendroid status at http://localhost:5555/wd/hub/status
java -jar selendroid-standalone-0.12.0-with-dependencies.jar -app selendroid-test-app-0.12.0.apk -port 5555

4. Start grid with selendroid and ios plug-in - See grid status at http://localhost:4444/grid/console#
java -Dfile.encoding=UTF-8 -cp "ios-grid-plugin-0.6.6-SNAPSHOT.jar:selendroid-grid-plugin-0.12.0.jar:selenium-server-standalone-2.43.1.jar" org.openqa.grid.selenium.GridLauncher -capabilityMatcher io.selendroid.grid.SelendroidCapabilityMatcher -role hub -host 127.0.0.1 -port 4444

5. Register selendroid node
curl -H "Content-Type: application/json" -X POST --data @selendroid-nodes-config.json http://localhost:4444/grid/register

6. Start chrome, firefox and safari node
java -jar selenium-server-standalone-2.43.1.jar -role node -Dwebdriver.chrome.driver="chromedriver" -Dwebdriver.safari.driver="WebDriver.safariextz" -hub http://localhost:4444/grid/register --no-sandbox -maxSession 10 -browser browserName=chrome,maxInstances=5,platform=MAC -browser browserName=safari,maxInstances=5,platform=MAC -browser browserName=firefox,maxInstances=5,platform=MAC -port 5556

7. Start ios node
java -jar ios-server-standalone-0.6.6-SNAPSHOT.jar -hub http://localhost:4444/grid/register -proxy org.uiautomation.ios.grid.IOSRemoteProxy -port 5557

