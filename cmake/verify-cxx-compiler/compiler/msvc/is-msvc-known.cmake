include_guard(GLOBAL)

function(is_msvc_known is_msvc_known_param)
    find_program(MSVC_CL "cl")

    set(IS_MSVC_KNOWN_VAL DEFINED MSVC_CL)

    if (NOT IS_MSVC_KNOWN_VAL)
        message(AUTHOR_WARNING "MSVC CL not found.")
    endif ()

    set("${is_msvc_known_param}" IS_MSVC_KNOWN_VAL PARENT_SCOPE)
endfunction()