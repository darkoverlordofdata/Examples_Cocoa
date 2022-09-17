#import <Cocoa/Cocoa.h>


@interface Window : NSWindow {
  NSImageView* pictureBox1;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end
