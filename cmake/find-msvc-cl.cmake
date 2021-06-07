#!/usr/bin/env -S cmake -P

include_guard(GLOBAL)

file(GLOB vs_version_dirs
     LIST_DIRECTORIES true
     "C:/Program Files (x86)/Microsoft Visual Studio/[0-9]*")

if (NOT vs_version_dirs)
    message(FATAL_ERROR "Visual Studio is not installed.")
endif ()

list(GET vs_version_dirs -1 newest_vs_version_dir)

file(GLOB msvc_version_dirs
     LIST_DIRECTORIES true
     "${newest_vs_version_dir}/Community/VC/Tools/MSVC/*")

if (NOT msvc_version_dirs)
    message(FATAL_ERROR "MSVC is not installed.")
endif ()

list(GET msvc_version_dirs -1 newest_msvc_version_dir)

set(newest_msvc_version_arch_dir "${newest_msvc_version_dir}/bin/Hostx64/x64")

find_program(MSVC_CL
             "cl"
             PATHS "${newest_msvc_version_arch_dir}"
             NO_DEFAULT_PATH)

if (NOT MSVC_CL)
    message(FATAL_ERROR "MSVC CL not found.")
endif ()

message("${MSVC_CL}")