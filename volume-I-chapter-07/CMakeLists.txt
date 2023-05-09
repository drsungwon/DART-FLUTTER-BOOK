cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(sum_ffi_library VERSION 1.0.0 LANGUAGES C)
add_library(sum_ffi_library SHARED sum_ffi.c sum_ffi.def)
add_executable(sum_ffi_test sum_ffi.c)

set_target_properties(sum_ffi_library PROPERTIES
    PUBLIC_HEADER sum_ffi.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "sum_ffi"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)
