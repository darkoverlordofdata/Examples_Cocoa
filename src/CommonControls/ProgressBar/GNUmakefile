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
# ProgressBar
#
VERSION = 1.0.0
PACKAGE_NAME = ProgressBar
APP_NAME = ProgressBar
ProgressBar_APPLICATION_ICON = ProgressBar.tiff


#
# Resource files
#
ProgressBar_RESOURCE_FILES = \
Resources/ProgressBar.tiff 



#
# Class files
#
ProgressBar_OBJC_FILES = \
ProgressBar.m 


#
# Makefiles
#
-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble
