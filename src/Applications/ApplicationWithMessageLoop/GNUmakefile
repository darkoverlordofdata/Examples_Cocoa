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
# ApplicationWithMessageLoop
#
VERSION = 1.0.0
PACKAGE_NAME = ApplicationWithMessageLoop
APP_NAME = ApplicationWithMessageLoop
ApplicationWithMessageLoop_APPLICATION_ICON = ApplicationWithMessageLoop.tiff


#
# Resource files
#
ApplicationWithMessageLoop_RESOURCE_FILES = \
Resources/ApplicationWithMessageLoop.tiff 



#
# Class files
#
ApplicationWithMessageLoop_OBJC_FILES = \
ApplicationWithMessageLoop.m 


#
# Makefiles
#
-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble
