include_guard(GLOBAL)

if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    set(TOOLCHAIN "CLANG")
elseif (CMAKE_CXX_COMPILER_ID STREQUAL "gcc")
    set(TOOLCHAIN "GCC")
elseif (MSVC)
    set(TOOLCHAIN "MSVC")
endif ()

if (TOOLCHAIN)
    set(${TOOLCHAIN} true)
    message(STATUS "Toolchain: ${TOOLCHAIN}")
endif ()

# See the following link for other compiler variables defined automatically by CMake : https://cmake.org/cmake/help/latest/manual/cmake-variables.7.html