# Ref : https://cliutils.gitlab.io/modern-cmake/

set(TARGET_NAME "learn-cpp20-app")
add_executable(${TARGET_NAME} Main.cpp)

file(GLOB_RECURSE HEADERS
     FOLLOW_SYMLINKS
     LIST_DIRECTORIES false
     CONFIGURE_DEPENDS
     "${PROJECT_INCLUDE_DIR}/*.[hm]pp")

target_include_directories(${TARGET_NAME} PRIVATE ${PROJECT_INCLUDE_DIR})

set_target_properties(
        ${TARGET_NAME}
        PROPERTIES
        CXX_STANDARD 20
        CXX_STANDARD_REQUIRED ON
        CXX_EXTENSIONS OFF)

target_compile_features(${TARGET_NAME} PUBLIC cxx_std_20)

source_group(
        TREE ${PROJECT_INCLUDE_DIR}
        PREFIX "Headers"
        FILES ${HEADERS})
