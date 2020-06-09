cmake_minimum_required(VERSION 3.4.1)  # for example

add_library( hot_reload_issue

             # Sets the library as a shared library.
             SHARED

             # Provides a relative path to your source file(s).
             ../ios/Classes/StartStop.cpp )
