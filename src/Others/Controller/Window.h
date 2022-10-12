#include <Cocoa/Cocoa.h>
#import <NSPatch/NSPatch.h>


@interface Window : NSWindow {
  NSButton* button1;
  NSButton* button2;
  NSTextField* label1;
  NSTextField* label2;
  int button1Clicked;
  int button2Clicked;
}

- (instancetype) init;
- (BOOL)windowShouldClose:(id)sender;
- (IBAction) OnButton1Click:(id)sender;
- (IBAction) OnButton2Click:(id)sender;
@end

