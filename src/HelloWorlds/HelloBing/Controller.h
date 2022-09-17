#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "Window.h"
#define DIMENSION    24
#define MARGIN        6

@interface Controller : NSObject
{
    Window *window;
}

-(void)applicationDidFinishLaunching:(NSNotification *)aNotification;


@end

