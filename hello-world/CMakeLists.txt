cmake_minimum_required(VERSION 3.16)

set (CMAKE_CXX_STANDARD 17)

set(app hello-world)

project(${app})

set(ENV{PKG_CONFIG_PATH} "/opt/rocksdb/lib/pkgconfig")

find_package(PkgConfig REQUIRED)
pkg_search_module(ROCKSDB REQUIRED rocksdb)

add_executable(${app} main.cc)
target_include_directories(${app} PUBLIC ${ROCKSDB_INCLUDE_DIRS})
target_link_directories(${app} PUBLIC ${ROCKSDB_LIBRARY_DIRS})

# ref: /opt/rocksdb/lib/pkgconfig/rocksdb.pc
target_link_libraries(${app} pthread ${ROCKSDB_LIBRARIES} -lpthread -lrt -ldl -lsnappy -lgflags -lz -lbz2 -llz4 -lzstd)
