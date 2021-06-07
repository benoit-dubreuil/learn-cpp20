include_guard(GLOBAL)

function(is_msvc_known is_msvc_known_param)
    find_program(MSVC_CL
                 "cl")

    if (NOT MSVC_CL)
        message(AUTHOR_WARNING "MSVC CL not found.")
        return()
    endif ()

    set("${is_msvc_known_param}" "${MSVC_CL}" PARENT_SCOPE)
endfunction()