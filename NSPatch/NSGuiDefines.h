#import <Cocoa/Cocoa.h>

// missing enum values in gnustep-gui

#define NSBezelStyleRounded 1
#define NSBezelStyleRegularSquare 2
#define NSBezelStyleShadowlessSquare 6
#define NSBezelStyleSmallSquare 10
#define NSBezelStyleRoundRect 12
#define NSBezelStyleInline 15
#define NSBezelStyleRecessed 13
#define NSBezelStyleDisclosure 5
#define NSBezelStyleRoundedDisclosure 14
#define NSBezelStyleCircular 7
#define NSBezelStyleHelpButton 9
#define NSBezelStyleTexturedRounded 12
#define NSBezelStyleTexturedSquare 8

#define NSButtonTypeSwitch NSSwitchButton
#define NSButtonTypeOnOff  NSOnOffButton

#define NSButtonTypeRadio NSRadioButton

#define NSEventMaskAny NSUIntegerMax

#define NSEventModifierFlagCapsLock (1 << 16)
#define NSEventModifierFlagShift (1 << 17)
#define NSEventModifierFlagControl (1 << 18)
#define NSEventModifierFlagOption  (1 << 19)
#define NSEventModifierFlagCommand (1 << 20)
#define NSEventModifierFlagNumericPad (1 << 21)
#define NSEventModifierFlagHelp (1 << 22)
#define NSEventModifierFlagFunction (1 << 23)
#define NSEventModifierFlagDeviceIndependentFlagsMask = 0xffff0000UL
