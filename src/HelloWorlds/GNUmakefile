#
#  Main Makefile for Examples_Cocoa
#  
#  Copyright (C) 2022 MIT License
#
#  Written by:	darkoverlordofdata
#
#

VERSION = 1.1.0
PACKAGE_NAME = Examples_Cocoa
SVN_MODULE_NAME = Examples_Cocoa
SVN_BASE_URL=https://github.com/darkoverlordofdata/Examples_Cocoa

# This usually happens when you source GNUstep.sh, then run ./configure,
# then log out, then log in again and try to compile
ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif

ifeq ($(GNUSTEP_MAKEFILES),)
  $(error You need to run the GNUstep configuration script before compiling!)
endif

include $(GNUSTEP_MAKEFILES)/common.make

#
# The list of subproject directories
#
SUBPROJECTS = HelloBing HelloWorld

-include Makefile.preamble

-include GNUmakefile.local

include $(GNUSTEP_MAKEFILES)/aggregate.make

-include Makefile.postamble

