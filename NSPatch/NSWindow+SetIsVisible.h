#import <Cocoa/Cocoa.h>

@interface NSWindow (NSWindowSetIsVisible)
- (void)setIsVisible: (BOOL) yes_no;
@end

@implementation NSWindow (NSWindowSetIsVisible)
- (void)setIsVisible: (BOOL) flag {
  // _f.visible = flag;
  if (flag)
    {
      [self orderFrontRegardless];
    }
  else
    {
      [self orderOut: nil];
    }  
  // if (yes_no) {
  //     [self center];
  //     [self orderFrontRegardless];
  //     [self makeKeyWindow];
  //     [self display];
  // }
}
@end
