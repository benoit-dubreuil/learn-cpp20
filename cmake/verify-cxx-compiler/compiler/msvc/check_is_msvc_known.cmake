include_guard(GLOBAL)

function(check_is_msvc_known r_is_msvc_known_param)
    find_program(MSVC_CL "cl")

    if (MSVC_CL)
        set(IS_MSVC_KNOWN true)
    else ()
        set(IS_MSVC_KNOWN false)
        message(AUTHOR_WARNING "MSVC CL not found.")
    endif ()

    set("${r_is_msvc_known_param}" ${IS_MSVC_KNOWN} PARENT_SCOPE)
endfunction()