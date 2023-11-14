cmake_minimum_required ( VERSION 3.16 )

# Project
project ( application VERSION 1.0.0 )
set ( VERSION 1.0.0 )
set ( RELEASE_NAME application )
set ( PROJECT_NAME application )
set ( APP_NAME "Application" )
set ( CMAKE_EXPORT_COMPILE_COMMANDS ON )

find_package ( GNUstep REQUIRED )

link_directories ( GNUSTEP_LIBRARY_DIRS )
include_directories ( AFTER #{GNUSTEP_INCLUDE_DIRS}) 

# Application
add_executable(${APP_NAME} Application.m)
target_link_libraries(${APP_NAME} ${GNUSTEP_LIBRARIES})
# set_target_properties(${APP_NAME} PROPERTIES FOLDER "Applications")
