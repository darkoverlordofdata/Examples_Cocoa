#include <Cocoa/Cocoa.h>

int main(int argc, char* argv[]) {
  @autoreleasepool {
    #if defined(__FreeBSD__)
    [NSApplication sharedApplication];
    #endif
    NSWindow* window1 = [[[NSWindow alloc] initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO] autorelease];
    #if defined(__APPLE__) 
    [window1 setIsVisible:YES];
    [NSApplication sharedApplication];
    #elif defined(__FreeBSD__)
    [window1 makeKeyAndOrderFront: nil]; 
    #endif
    [NSApp run];
  }
}
