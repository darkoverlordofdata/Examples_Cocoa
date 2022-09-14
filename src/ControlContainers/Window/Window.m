#include <Cocoa/Cocoa.h>

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

#define NSAlertStyleWarning 0

@interface Window : NSWindow {
  NSButton* button;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  button = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 443, 90, 32)] autorelease];
  [button setTitle:@"Close"];
  [button setBezelStyle:NSBezelStyleRounded];
  [button setAction:@selector(performClose:)];
  [button setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  [super initWithContentRect:NSMakeRect(320, 200, 640, 480) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Window example"];
  [[self contentView] addSubview:button];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  NSAlert* alert = [[NSAlert alloc] init];
  [alert setMessageText:@"Close Window"];
  [alert setInformativeText:@"Are you sure you want exit?"];
  [alert setAlertStyle:NSAlertStyleWarning];
  [alert addButtonWithTitle:@"Yes"];
  [alert addButtonWithTitle:@"No"];

#if (__APPLE__)
  [alert beginSheetModalForWindow:self completionHandler:^(NSModalResponse returnCode) {
    if (returnCode == NSAlertFirstButtonReturn) {
      [sender close];
      [NSApp stop:sender];
    }
  }];
#else
  NSInteger returnCode = [alert runModal]; 
  if (returnCode == NSAlertFirstButtonReturn)
    [NSApp terminate:sender];
#endif
  return NO;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
