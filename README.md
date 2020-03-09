<!--
project owner： zaccurli
data：20200309 
-->

## 介绍
procrank 和 procmem 可以用于Android内存检测，使用方法可以自行google  

内存耗用：VSS/RSS/PSS/USS   

• VSS - Virtual Set Size 虚拟耗用内存（包含共享库占用的内存）  

• RSS - Resident Set Size 实际使用物理内存（包含共享库占用的内存）  

• PSS - Proportional Set Size 实际使用的物理内存（比例分配共享库占用的内存）  

• USS - Unique Set Size 进程独自占用的物理内存（不包含共享库占用的内存）  


源码位于：/system/extras/procrank   


本例源码使用的是Android7.0下的`WORKING_DIRECTORY/system/extras`文件   

已经添加`bionic/libc/upstream-openbsd/lib/libc/string/strlcpy.c`   




## 依赖
cmake : 本例基于[cmake version 3.11.4]   

NDK   : 本例基于[android-ndk-r20]clang   




## 使用
1. 下载并进入目录
```
git clone git@github.com:ZaccurLi/procrank_procmem.git
cd procrank_procmem
```

2. 编译   

2.1 首先设置NDK目录   
```
export NDK_HOME_PATH=/ndk_path
```

2.2 编译   

Android编译直接执行`build.sh`脚本   
```
./build.sh
```

或执行编译步骤   
```
mkdir build && cd build 
cmake -DARMV7=ON ..
make
```

不需要Android版本，直接编译主机版本的可以执行   
```
mkdir build && cd build 
cmake ..
make
```

3. release_   
内存有已经编译好的32bit release版本： procrank和procmem   

可以直接push到手机运行   




## Android安装
将`procrank`和`procmem`文件push到手机的`/system/xbin`目录下,`libpagemap.a`文件到`/system/lib`目录下   
```
adb root
adb remount
adb push procrank /system/xbin
adb push procmem /system/xbin
```

如果没有权限的话，添加权限   
```
chmod 777 /system/xbin/procrank
chmod 777 /system/xbin/procmem
```

remount命令有问题的话，可以重新挂载system   
```
mount -o remount,rw /system
```


## Contact
```
zaccurli
```