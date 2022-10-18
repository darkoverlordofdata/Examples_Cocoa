#include <Cocoa/Cocoa.h>
#import <NSPatch/NSPatch.h>


@interface Window : NSWindow  {
  NSComboBox* comboBox1;
  NSComboBox* comboBox2;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

