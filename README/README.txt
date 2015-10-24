if cocos2dx project output 'stopped application ---', enable android emulator 'use host GPU'.
----- consititution use android virtual device -----
Device : (480 * 800:mdpi)
Target Android 4.0.3 API Level 15
CPU/ABI: ARM
Skin: Skin with dynamic hardware controls (* this is push able button appeir)
RAM:512 VM Heap: 16
[x] Use Host GPU
----- end consititution use android virtual device --

----------- create accerelation emulator (use host GPU) -------
1. check virtual suport cpu
   $ egrep -c '(vmx|svm)' /proc/cpuinfo
   0 on erro, other on success

2. check tool install 
   $ sudo apt-get install cpu-checker

3. KVM check

   $ kvm-ok
   return literal is
   ------------------
   INFO: /dev/kvm exists
   KVM acceleration can be used
   ------------------
   upper data is successful
   
   
4. 64bit cpu check(but also 32bit is useable)
   64だとメモリの2G境界を超えられるのでおすすめということ 
   $ egrep -c ' lm ' /proc/cpuinfo
   0 on 32bit CPU, other on 64bit CPU      

   $ uname -m
   x86_64 on 64bit kernel
   i386, i686, i586, i486 on 32 bit kernel

5. KVM install 
   $ sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils

6. add myaccount to kvm, libvirtd
   $ sudo adduser 　名前　 kvm
   $ sudo adduser 　名前 　libvirtd
   after reboot or relogin

7. check

-------------------------------
$ sudo virsh -c qemu:///system list 
Id Name                 State
---------------------------------

--------------------------------
   upper good return variable.

8.Android Virtual Device Manager でｘ８６でエミュレータ（仮想マシン名）を適当に作成し
　$ /tools/emulator-x86 -avd ”仮想マシン名” -qemu -m 2047 -enable-kvm
　で高速エミュレータが動作 
　 
 $ ~/local/sdk/android-sdk/tools/emulator-x86 -avd android_2.3.3 -qemu -m 2047 -enable-kvm

----------- end create accerelation emulator (use host GPU) -------


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
