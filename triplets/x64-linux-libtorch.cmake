# https://github.com/microsoft/vcpkg/issues/37141

set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_LIBRARY_LINKAGE static)

set(VCPKG_CMAKE_SYSTEM_NAME Linux)

# set(VCPKG_CMAKE_CONFIGURE_OPTIONS -DCUDAToolkit_ROOT=/usr/local/cuda-12.1 -DCMAKE_CUDA_COMPILER=/usr/local/cuda-12.1/bin/nvcc -DCUDAToolkit_INCLUDE_DIR=/usr/local/cuda-12.1/include)
# libtorch requires gflags and glog to be dynamic to link to it
if (${PORT} MATCHES "gflags|glog")
    set(VCPKG_LIBRARY_LINKAGE dynamic)
    set(VCPKG_FIXUP_ELF_RPATH ON)
endif()
