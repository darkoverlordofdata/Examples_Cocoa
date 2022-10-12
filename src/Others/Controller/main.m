#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "Controller.h"

int main(int argc, const char *argv[]) 
{

  @autoreleasepool {
    [NSApplication sharedApplication];
    Controller *controller = [Controller new];
    [[NSApplication sharedApplication] setDelegate: controller];

    NSApplicationMain(argc, argv);

  }
}