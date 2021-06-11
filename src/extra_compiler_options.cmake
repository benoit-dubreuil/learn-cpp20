include_guard(GLOBAL)

include("${PROJECT_CMAKE_SCRIPT_DIR}/detect_toolchain.cmake")

if (MSVC)
    target_compile_options(${TARGET_NAME} PRIVATE /experimental:module)
endif ()