cmake_minimum_required(VERSION 3.28)

# ======== [Optionnal] declare module path and include somes - before stating the project
# In this case, collect any module in a 'cmake' folder
# --------
# list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
# include(before_cmake_project__rpi_pico_sdk)
# ------------------------------------------------------------------------

# ======== [Project main features]
project(hello_tos)
set(CMAKE_CXX_STANDARD 23)
add_compile_options(-Wall -Wextra -Wpedantic)

# Generate the db for clang toolings by default
# need to call supplemental target
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
message("export compile command is ${CMAKE_EXPORT_COMPILE_COMMANDS}")

# ======== [Cross compiling stuff]
# the name of the target operating system
# (There are some target known by cmake, but not this one)
set(CMAKE_SYSTEM_NAME Atari)

# which compilers to use for C and C++
set(CMAKE_C_COMPILER   m68k-atari-mintelf-gcc)
set(CMAKE_CXX_COMPILER m68k-atari-mintelf-g++)

# where is the target environment located
set(CMAKE_FIND_ROOT_PATH  /usr/m68k-atari-mintelf/sys-root/usr/include)

# adjust the default behavior of the FIND_XXX() commands:
# search programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# ======== [build setup]
# FOR NOW : all variables are defined manually
set(BINARY "hlo_tos.prg")

set(SOURCES
    src/__main__.cpp
    src/hello.cpp
    src/wait.cpp
) # etc

add_executable(${BINARY} ${SOURCES})

target_include_directories(
    ${BINARY} PUBLIC
    ./include
)
