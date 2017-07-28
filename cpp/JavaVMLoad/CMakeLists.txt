# The name of our project is "HELLO". CMakeLists files in this project can
# refer to the root source directory of the project as ${HELLO_SOURCE_DIR} and
# to the root binary directory of the project as ${HELLO_BINARY_DIR}.
cmake_minimum_required (VERSION 2.6)
project (test_vm_init)

include_directories("/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/System/Library/Frameworks/JavaVM.framework/Versions/A/Headers")
LINK_DIRECTORIES("/Applications/Xcode.app/Contents/Applications/Application Loader.app/Contents/MacOS/itms/java/lib/server")

add_executable (test_vm_init
                src/main.cpp
                src/java_init.cpp) 
TARGET_LINK_LIBRARIES(test_vm_init jvm)