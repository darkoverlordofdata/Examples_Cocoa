cmake_minimum_required ( VERSION 3.16 )
###################################################################################
#
#   Build Examples_Cocoa
#
###################################################################################

# Solution
project ( cocoaexamples VERSION 0.0.1 ) 

# Options
set ( CMAKE_EXPORT_COMPILE_COMMANDS ON )
#
# enable features
#
include ( CMakeToolsHelpers OPTIONAL )
set_property ( GLOBAL PROPERTY USE_FOLDERS ON )

list ( APPEND CMAKE_MODULE_PATH ~/.local/lib/cmake/GNUstep )
find_package ( GNUstep REQUIRED )


# Projects
add_subdirectory ( src )
