cmake_minimum_required(VERSION 2.8)


message(" If you want to compile this project on armv7, please process cmake with \"-DARMV7=ON\" ")
message(" If you want to compile this project on armv8, please process cmake with \"-DARMV8=ON\" ")

#include the common compile info
# include(${CMAKE_SOURCE_DIR}/cmake/base.cmake)
message(STATUS "[CURRENT OPERATION SYSTEM] : ${CMAKE_HOST_SYSTEM_NAME}")
option(ARMV7 "option for armv7-a" OFF)
if(ARMV7)
    message(STATUS "[CROSSPLATFORM COMPILING] ARMV7")
    set(CROSSCOMPILE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/armv7-toolchain.cmake)
    include( ${CROSSCOMPILE_TOOLCHAIN_FILE} )
    # set(CMAKE_TOOLCHAIN_FILE ${CROSSCOMPILE_TOOLCHAIN_FILE})
elseif(ARMV8)
    message(STATUS "[CROSSPLATFORM COMPILING] ARMV8")
    set(CROSSCOMPILE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/armv8-toolchain.cmake)
    include( ${CROSSCOMPILE_TOOLCHAIN_FILE} )   
else()
    #CMAKE_SYSTEM CMAKE_SYSTEM_NAME CMAKE_HOST_SYSTEM_NAME
    message(STATUS "[DEFAULT COMPILING] CURRENT SYSTEM : ${CMAKE_HOST_SYSTEM_NAME}")
endif()


PROJECT (PROCRANK)


file(GLOB SOURCES "${PROJECT_SOURCE_DIR}/libpagemap/*.c")
#add_definitions (
#    -D_LARGEFILE64_SOURCE
#    )


# set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE Release)
# set(CMAKE_VERBOSE_MAKEFILE ON)

# --strip-all, -s Strip all debug and symbol information from the executable to make it smaller.
# --strip-debug, -S Strip all debug information from the executable to make it smaller.
set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -s")
set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -s")



include_directories (${PROJECT_SOURCE_DIR}/libpagemap/include)


add_library(pagemap ${SOURCES})

add_executable(procmem  ${PROJECT_SOURCE_DIR}/procmem/procmem.c)
target_link_libraries(procmem pagemap)


add_executable(procrank  ${PROJECT_SOURCE_DIR}/procrank/procrank.c ${PROJECT_SOURCE_DIR}/procrank/strlcpy.c)
target_link_libraries(procrank pagemap)
