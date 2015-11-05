----------- bash file ------------------

# create bash file
#!/bin/bash
ADB=/home/iceman/local/sdk/android-sdk/platform-tools/adb
"$ADB" uninstall test.evelinks.gdgd && "$ADB" install bin/myhello-debug.apk

----------- end bash file -------------

# create cocos2dx new project 
$ cocos new hello -l cpp -p test.test.hello -d .

# android emulator debugging tool logcat
$ ~/local/sdk/android-sdk/platform-tools/adb logcat > ~/hobby/SmartPhone/MyCompany/MyGame/proj.android/android_2_log

# android sdk (java project) create project
$ android create project --name myhello --target android-10 --path ./ --activity hello --package org.evelinks.gdgd
$ ant debug

# android application remove command
$ adb uninstall <package name>
-- $ adb uninstall org.evelinks.gdgd

# transport android emulator to android application (transport *.apk file to emulator)
# transport application to current running emulator.
$ adb install <*.apk path>

------------------ Create NDK Projects -----------------------------------

# 1. ndk project nothing build.xml. create build.xml command
  # first android target emulator list
  -- $ android list target | less
$ android update project -p . -t 1

# 2. build projects
$ ndk-build

# 3. create debug apk
$ ant debug

# 4. debug.apk install to emulator
$ adb install <debug.apk path>

------------------ End Create NDK Projects -------------------------------

------------------ Create Cocos2dx Projects -----------------------------------

# 1. ndk project nothing build.xml. create build.xml command
  # first android target emulator list
  -- $ android list target | less
$ android update project -p . -t 1

# 2. build projects
$ ndk-build

# 3. create debug apk
$ ant debug

# 4. debug.apk install to emulator
$ adb install <debug.apk path>

------------------ End Create Cococ2dx Projects -------------------------------

