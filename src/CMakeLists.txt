# Ref : https://cliutils.gitlab.io/modern-cmake/

set(TARGET_NAME "learn-cpp20-app")
add_executable(${TARGET_NAME} Main.cpp)

file(GLOB_RECURSE HEADER_LIST
        FOLLOW_SYMLINKS
        LIST_DIRECTORIES false
        RELATIVE "${PROJECT_SOURCE_DIR}"
        CONFIGURE_DEPENDS
        "${PROJECT_INCLUDE_DIR}/*.hpp")


target_include_directories(learn-cpp20 PRIVATE ${PROJECT_INCLUDE_DIR})
target_compile_features(learn-cpp20 PUBLIC cxx_std_20)

# IDEs should put the headers in a nice place
source_group(
        TREE ${PROJECT_INCLUDE_DIR}
        PREFIX "Headers"
        FILES ${HEADER_LIST})
