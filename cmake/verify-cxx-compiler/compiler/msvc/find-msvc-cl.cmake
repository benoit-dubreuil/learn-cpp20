include_guard(GLOBAL)

function(find_msvc_cl msvc_cl_param)
    file(GLOB vs_version_dirs
         LIST_DIRECTORIES true
         "C:/Program Files (x86)/Microsoft Visual Studio/[0-9]*")

    if (NOT vs_version_dirs)
        message(AUTHOR_WARNING "Visual Studio is not installed.")
        return()
    endif ()

    list(GET vs_version_dirs -1 newest_vs_version_dir)

    file(GLOB msvc_version_dirs
         LIST_DIRECTORIES true
         "${newest_vs_version_dir}/Community/VC/Tools/MSVC/*")

    if (NOT msvc_version_dirs)
        message(AUTHOR_WARNING "MSVC is not installed.")
        return()
    endif ()

    list(GET msvc_version_dirs -1 newest_msvc_version_dir)

    set(newest_msvc_version_arch_dir "${newest_msvc_version_dir}/bin/Hostx64/x64")

    find_program(MSVC_CL
                 "cl"
                 PATHS "${newest_msvc_version_arch_dir}"
                 NO_DEFAULT_PATH)

    if (NOT MSVC_CL)
        message(AUTHOR_WARNING "MSVC CL not found.")
        return()
    endif ()

    set("${msvc_cl_param}" "${MSVC_CL}" PARENT_SCOPE)
endfunction()