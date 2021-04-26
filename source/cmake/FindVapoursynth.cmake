include(FindPackageHandleStandardArgs)

if(WIN32)
    GET_FILENAME_COMPONENT(VS_FOLDER "[HKEY_LOCAL_MACHINE\\SOFTWARE\\VapourSynth;Path]" ABSOLUTE)
    if("${VS_FOLDER}" STREQUAL "/registry")
        unset(VS_FOLDER)
        GET_FILENAME_COMPONENT(VS_FOLDER "[HKEY_CURRENT_USER\\SOFTWARE\\VapourSynth;Path]" ABSOLUTE CACHE)
    endif()

    SET(VS_INCLUDE_DIR "${VS_FOLDER}/sdk/include")
else()
    find_path(VS_FOLDER NAMES vapoursynth PATHS usr PATH_SUFFIXES include)
endif()

if(VS_FOLDER)
    SET(ENABLE_VPYSYNTH ON)
else()
    SET(ENABLE_VPYSYNTH OFF)
endif()

# Provide standardized success/failure messages
find_package_handle_standard_args("Vapoursynth"
    REQUIRED_VARS VS_INCLUDE_DIR ENABLE_VPYSYNTH)
