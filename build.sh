
mkdir -p build

cd build 

#export NDK_HOME_PATH=/ndk_path/android-ndk-r20

cmake -DARMV7=ON ..

make


