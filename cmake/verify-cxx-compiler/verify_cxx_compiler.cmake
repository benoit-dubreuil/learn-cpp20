include_guard(GLOBAL)

include("${CMAKE_CURRENT_LIST_DIR}/compiler/msvc/assure_cxx_env_is_msvc.cmake")

function(verify_cxx_compiler)

    if (DEFINED CACHE{CMAKE_CXX_COMPILER})
        string(TOLOWER $CACHE{CMAKE_CXX_COMPILER} lowered_cmake_cxx)
    endif ()

    if (lowered_cmake_cxx)
        if (lowered_cmake_cxx STREQUAL "cl")
            message(STATUS "Assure CXX CACHE is MSVC")
            assure_cxx_env_is_msvc()
        endif ()
        
        return()
    endif ()

    if (DEFINED ENV{CXX})
        string(TOLOWER $ENV{CXX} lowered_env_cxx)
    endif ()

    if (lowered_env_cxx)
        if (lowered_env_cxx STREQUAL "cl")
            message(STATUS "Assure CXX ENV is MSVC")
            assure_cxx_env_is_msvc()
        endif ()

        return()
    endif ()

    message(AUTHOR_WARNING "No defined compiler to verify.")

endfunction()

