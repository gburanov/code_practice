cmake_minimum_required(VERSION 3.1)
project(codejam)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

set(SOURCE_FILES
                main.cpp
                base_solution.cpp
                blank_solution.cpp
                string_helpers.cpp
                #africa/reserve_words.cpp
                #africa/t9.cpp
                #2008/minimum_scalar_product.cpp
                #2008/milkshakes.cpp
                #2014/charging.cpp
                #2014/repeater.cpp
                #2015/stading_ovation.cpp
                #2015/ominous.cpp
                #2015/dijkstra.cpp
                #2015/pancakes.cpp
                #2015/r1at1.cpp
                #2015/r1at3.cpp
                #2015/r1a4.cpp
                2015/r2a1.cpp
                )
add_executable(codejam ${SOURCE_FILES})