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
# RadioButton
#
VERSION = 1.0.0
PACKAGE_NAME = RadioButton
APP_NAME = RadioButton
RadioButton_APPLICATION_ICON = RadioButton.tiff


#
# Resource files
#
RadioButton_RESOURCE_FILES = \
Resources/RadioButton.tiff 



#
# Class files
#
RadioButton_OBJC_FILES = \
RadioButton.m 


#
# Makefiles
#
-include GNUmakefile.preamble
include $(GNUSTEP_MAKEFILES)/aggregate.make
include $(GNUSTEP_MAKEFILES)/application.make
-include GNUmakefile.postamble
