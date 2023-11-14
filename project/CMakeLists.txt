cmake_minimum_required(VERSION 3.20)

project("lab3_fuzz" C)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -gdwarf-4 -Wall -Wextra -Wpedantic -fno-omit-frame-pointer")

set(SRC src)
set(LIB lib)

# Specify source files for the library
file(GLOB LIB_SRC ${LIB}/*.c)
file(GLOB LIB_HEADERS ${LIB}/*.h)

# Create a static library from the source files
add_library(my_library STATIC ${LIB_SRC})

# Specify include directories for the library
target_include_directories(my_library PUBLIC ${LIB})

# Install the library to the 'lib' directory
install(TARGETS my_library DESTINATION lib)

# Install header files to the 'include' directory
#install(DIRECTORY lib/*.h DESTINATION include)
install(FILES ${LIB_HEADERS} DESTINATION include)
# Create an executable using the main.c file and the library
add_executable(bin main.c)
target_link_libraries(bin PRIVATE my_library m)
