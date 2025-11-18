# ========================================================================
# (c) 2025 David SPORN,
# SPDX-License-Identifier: GPL-3.0-or-later
# ------------------------------------------------------------------------

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
