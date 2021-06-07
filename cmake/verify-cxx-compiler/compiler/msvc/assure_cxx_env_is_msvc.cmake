include_guard(GLOBAL)

include("check_is_msvc_known.cmake")
include("find_msvc.cmake")
include("assure_cxx_env_is_msvc.cmake")

function(assure_cxx_env_is_msvc)
    check_is_msvc_known(is_msvc_known)

    if (NOT is_msvc_known)
        find_msvc(msvc_cl)

        if (msvc_cl)
            set(ENV{CXX} "${msvc_cl}")
            unset(ENV{CXXFLAGS})
        endif ()
    endif ()

endfunction()