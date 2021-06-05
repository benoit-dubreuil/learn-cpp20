# Ref : https://cliutils.gitlab.io/modern-cmake/

file(GLOB_RECURSE HEADER_LIST
        FOLLOW_SYMLINKS
        LIST_DIRECTORIES false
        RELATIVE "${PROJECT_SOURCE_DIR}"
        CONFIGURE_DEPENDS
        "${PROJECT_SOURCE_DIR}/include/*.hpp")

add_executable(learn-cpp20 Main.cpp)

target_compile_features(modern_library PRIVATE cxx_std_20)

target_include_directories(learn-cpp20 PRIVATE "${PROJECT_SOURCE_DIR}/include")

# IDEs should put the headers in a nice place
source_group(
        TREE "${PROJECT_SOURCE_DIR}/include"
        PREFIX "Headers"
        FILES ${HEADER_LIST})
