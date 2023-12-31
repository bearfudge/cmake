
cmake_minimum_required(VERSION 3.18)
project(ISPCStaticLibrary CXX ISPC)

add_library(ispc_objects STATIC simple.ispc)

if("${CMAKE_SYSTEM_NAME};${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "Darwin;arm64")
  target_compile_options(ispc_objects PRIVATE "$<$<COMPILE_LANGUAGE:ISPC>:--target=neon-i32x4>")
else()
  target_compile_options(ispc_objects PRIVATE "$<$<COMPILE_LANGUAGE:ISPC>:--target=sse2-i32x4>")
  if(CMAKE_SIZEOF_VOID_P EQUAL 4)
    target_compile_options(ispc_objects PRIVATE "$<$<COMPILE_LANGUAGE:ISPC>:--arch=x86>")
  endif()
endif()

set_target_properties(ispc_objects PROPERTIES POSITION_INDEPENDENT_CODE ON)

add_executable(ISPCStaticLibrary main.cxx)
target_link_libraries(ISPCStaticLibrary PRIVATE ispc_objects)
