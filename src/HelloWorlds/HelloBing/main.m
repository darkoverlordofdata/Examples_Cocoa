#import <Cocoa/Cocoa.h>
#import "Controller.h"
#import "Window.h"


// int main(int argc, char* argv[]) {
//   [NSApplication sharedApplication];
//   [[[[Window alloc] init] autorelease] makeMainWindow];
//   [NSApp run];
// }


int main(int argc, const char* argv[]) {
  [NSApplication sharedApplication];
  
   Controller *controller = [Controller new];
   [NSApp setDelegate: controller];

   NSApplicationMain(argc, argv);

  [NSApp run];
}


