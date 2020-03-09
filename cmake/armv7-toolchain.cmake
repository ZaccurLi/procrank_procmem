# The following variables from ${NDK_HOME_PATH}/build/cmake/android.toolchain.cmake
# set(CMAKE_TRY_COMPILE_PLATFORM_VARIABLES
# ANDROID_TOOLCHAIN
# ANDROID_ABI
# ANDROID_PLATFORM
# ANDROID_STL
# ANDROID_PIE
# ANDROID_CPP_FEATURES
# ANDROID_ALLOW_UNDEFINED_SYMBOLS
# ANDROID_ARM_MODE
# ANDROID_ARM_NEON
# ANDROID_DISABLE_FORMAT_STRING_CHECKS
# ANDROID_CCACHE)

# set (NDK_HOME_PATH ${NDK_ROOT_PATH}/android-ndk-r20)

if(NOT DEFINED ENV{NDK_HOME_PATH})
    # NOT FIND NDK_HOME_PATH in ENVIRONMENT PATH
    message(FATAL_ERROR "Not defined environment variable: NDK_HOME_PATH")
endif()
message(STATUS "NDK_HOME_PAHT: $ENV{NDK_HOME_PATH}")

set (NDK_HOME_PATH $ENV{NDK_HOME_PATH})
set (ANDROID_ABI armeabi-v7a) #arm64-v8a
set (ANDROID_PLATFORM android-21)
set (ANDROID_TOOLCHAIN clang++)
set (ANDROID_STL c++_static) #c++_shared ---> CANNOT LINK EXECUTABLE "xxx": library "libc++_shared.so" not found
set (ANDROID_ARM_NEON TRUE)

# ANDROID_TOOLCHAIN eg. clang
# ANDROID_TOOLCHAIN_NAME eg. arm-linux-androideabi
# ANDROID_ARM_MODE eg. arm thumb

# CMAKE_HOST_SYSTEM_NAME eg. Darwin Linux Windows
# CMAKE_C_COMPILER_ID eg. Clang Gcc
# CMAKE_CXX_COMPILER_ID eg. Clang Gcc

include (${NDK_HOME_PATH}/build/cmake/android.toolchain.cmake)

message(STATUS "[CROSSPLATFORM COMPILING] TARGET SYSTEM     : ${CMAKE_SYSTEM_NAME}")
message(STATUS "[CROSSPLATFORM COMPILING] TARGET SYSVERSION : ${CMAKE_SYSTEM_VERSION}")
message(STATUS "[CROSSPLATFORM COMPILING] TARGET PROCESSOR  : ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "[CROSSPLATFORM COMPILING] TARGET ARCH ABI   : ${CMAKE_ANDROID_ARCH_ABI}")

# add_compile_options (
    # -I${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/sysroot/usr/include/c++/v1)
# add_link_options (-llog -lz)



if(NOT DEFINED ENV{OPENCV_ANDROID_SDK})
    # NOT FIND OPENCV_ANDROID_SDK in ENVIRONMENT PATH
    # message(FATAL_ERROR "Not defined environment variable: OPENCV_ANDROID_SDK")
    message( "Not defined environment variable: OPENCV_ANDROID_SDK")
endif()
message(STATUS "OPENCV_ANDROID_SDK: $ENV{OPENCV_ANDROID_SDK}")
set (OPENCV_ANDROID_SDK $ENV{OPENCV_ANDROID_SDK})
set( OpenCV_DIR ${OPENCV_ANDROID_SDK}/sdk/native/jni )


######################################################################
########## Commented "-landroid" in "OpenCVModules.cmake" ############
######### binary in /vendor/bin/ cannot find "libandroid.so" #########
######################################################################