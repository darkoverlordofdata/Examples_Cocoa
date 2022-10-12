#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <NSPatch/NSPatch.h>
#import "Window.h"

@interface Controller : NSObject
{
    // NSWindow *window;
    Window *window;
    NSTextField *label;

}

- (void)applicationWillFinishLaunching:(NSNotification *) not;
- (void)applicationDidFinishLaunching:(NSNotification *) not;

@end