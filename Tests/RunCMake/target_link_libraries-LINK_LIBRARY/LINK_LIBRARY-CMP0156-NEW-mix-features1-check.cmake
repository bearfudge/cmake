
include("${RunCMake_BINARY_DIR}/LINK_LIBRARY-CMP0156-NEW-build/LIBRARIES_PROCESSING.cmake")

if (CMAKE_C_LINK_LIBRARIES_PROCESSING MATCHES "ORDER=FORWARD")
  if (NOT actual_stdout MATCHES "(/|-)-PREFIXGROUP\"? +\"?(/|-)-LIBGROUP.*${LINK_SHARED_LIBRARY_PREFIX}base1${LINK_SHARED_LIBRARY_SUFFIX}\"? +\"?(/|-)-LIBGROUP.*${LINK_SHARED_LIBRARY_PREFIX}base3${LINK_SHARED_LIBRARY_SUFFIX}\"? +\"?(/|-)-SUFFIXGROUP")
    set (RunCMake_TEST_FAILED "Not found expected '--PREFIXGROUP --LIBGROUP<base1> --LIBGROUP<base3> --SUFFIXGROUP'.")
  endif()
else()
  if (NOT actual_stdout MATCHES "(/|-)-PREFIXGROUP\"? +\"?(/|-)-LIBGROUP.*${LINK_SHARED_LIBRARY_PREFIX}base3${LINK_SHARED_LIBRARY_SUFFIX}\"? +\"?(/|-)-LIBGROUP.*${LINK_SHARED_LIBRARY_PREFIX}base1${LINK_SHARED_LIBRARY_SUFFIX}\"? +\"?(/|-)-SUFFIXGROUP")
    set (RunCMake_TEST_FAILED "Not found expected '--PREFIXGROUP --LIBGROUP<base3> --LIBGROUP<base1> --SUFFIXGROUP'.")
  endif()
endif()
