# Ref : https://cliutils.gitlab.io/modern-cmake/

cmake_minimum_required(VERSION 3.20)

project(LearnCpp20
        VERSION 0.0
        HOMEPAGE_URL "https://github.com/benoit-dubreuil/learn-cpp20"
        LANGUAGES CXX)


# Only do these if this is the main project, and not if it is included through add_subdirectory
if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)

    # Optionally set things like CMAKE_CXX_STANDARD, CMAKE_POSITION_INDEPENDENT_CODE here

    # Let's ensure -std=c++xx instead of -std=g++xx
    set(CMAKE_CXX_STANDARD 20)
    set(CMAKE_CXX_STANDARD_REQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)

    # Let's nicely support folders in IDEs
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)

    # Docs only available if this is the main app
    find_package(Doxygen)
    if (Doxygen_FOUND)
        add_subdirectory(doc)
    else ()
        message(STATUS "Doxygen not found, not building docs")
    endif ()
endif ()


add_subdirectory(src)