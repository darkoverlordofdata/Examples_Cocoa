#
# GNUmakefile - Generated by ProjectCenter
#
ifeq ($(GNUSTEP_MAKEFILES),)
 GNUSTEP_MAKEFILES := $(shell gnustep-config --variable=GNUSTEP_MAKEFILES 2>/dev/null)
endif
ifeq ($(GNUSTEP_MAKEFILES),)
 $(error You need to set GNUSTEP_MAKEFILES before compiling!)
endif

include $(GNUSTEP_MAKEFILES)/common.make

#
# ColoredTabPages
#
VERSION = 1.0.0
PACKAGE_NAME = ColoredTabPages
APP_NAME = ColoredTabPages
ColoredTabPages_APPLICATION_ICON = ColoredTabPages.tiff


#
# Resource files
#
ColoredTabPages_RESOURCE_FILES = \
Resources/ColoredTabPages.tiff 



#
# Class files
#
ColoredTabPages_OBJC_FILES = \
ColoredTabPages.m 


#
# Makefiles
#
-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble
