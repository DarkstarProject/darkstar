set_property(GLOBAL PROPERTY CXX_STANDARD 17)
set_property(GLOBAL PROPERTY CXX_STANDARD_REQUIRED ON)
set_property(GLOBAL PROPERTY CXX_EXTENSIONS ON)
set_property(GLOBAL PROPERTY LINKER_LANGUAGE CXX)

add_definitions(-DFMT_HEADER_ONLY)

if(UNIX)
    # TODO: add compiler/linker flags Debug/Release
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -Werror -fsigned-char ")

    add_definitions(
        -g
    )
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /std:c++latest /W3 /WX")
    add_definitions(
        -D_CONSOLE
        -D_MBCS
        -DNOMINMAX
        -DFMT_USE_WINDOWS_H=0
        -D_CRT_SECURE_NO_WARNINGS
        -D_CRT_NONSTDC_NO_DEPRECATE
        -D_WINSOCK_DEPRECATED_NO_WARNINGS
        /Ob2 # Inline Function Expansion
        /Oy- # Frame-Pointer Omission
    )

    if(CMAKE_CONFIGURATION_TYPES STREQUAL Debug)
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /INCREMENTAL /SAFESEH:NO")
        add_definitions(
            /ZI # Omit Default Library Name
            /Gm # Enable Minimal Rebuild
            /GR # Enable RTTI
        )
    else()
        set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /INCREMENTAL:NO /LTCG /OPT:REF /OPT:ICF")
        add_definitions(
            /Oi # Generate Intrinsic Functions
            /GL # Whole Program Optimization
            /Gy # Enable Function Level Linking
            /TP # C++ Source Files
            /GR- # Disable RTTI
        )
    endif()
endif()
