# Ref : https://cliutils.gitlab.io/modern-cmake/

cmake_minimum_required(VERSION 3.20)

project(LearnCpp20
        VERSION 0.0
        HOMEPAGE_URL "https://github.com/benoit-dubreuil/learn-cpp20"
        LANGUAGES CXX)

set(PROJECT_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include")

# Only do these if this is the main project, and not if it is included through add_subdirectory
if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)

    # Let's nicely support folders in IDEs
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)

    # Docs only available if this is the main app
    find_package(Doxygen)
    if (Doxygen_FOUND)
        add_subdirectory(doc)
    else ()
        message(STATUS "Doxygen not found, not building docs")
    endif ()

    # TODO : add test
endif ()


add_subdirectory(src)