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
# MainMenu
#
VERSION = 1.0.0
PACKAGE_NAME = MainMenu
APP_NAME = MainMenu
MainMenu_APPLICATION_ICON = MainMenu.tiff


#
# Resource files
#
MainMenu_RESOURCE_FILES = \
Resources/MainMenu.tiff 



#
# Class files
#
MainMenu_OBJC_FILES = \
MainMenu.m 


#
# Makefiles
#
-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble
