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

#define NSAlertStyleCritical 2
#define NSAlertStyleInformational 1
#define NSAlertStyleWarning 0

@interface Window : NSWindow {
  NSButton* buttonShowMessage;
}
- (IBAction) OnButtonClick:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end


@implementation Window
- (instancetype)init {
  buttonShowMessage = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 265, 100, 32)] autorelease];
  [buttonShowMessage setTitle:@"MessageBox"];
  [buttonShowMessage setBezelStyle:NSBezelStyleRounded];
  [buttonShowMessage setTarget:self];
  [buttonShowMessage setAction:@selector(OnButtonClick:)];
  [buttonShowMessage setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"MessageBox example"];
  [[self contentView] addSubview:buttonShowMessage];
  [self setIsVisible:YES];
  return self;
}
- (IBAction) OnButtonClick:(id)sender {
  NSAlert* alert = [[NSAlert alloc] init];
  [alert setMessageText:@"Message"];
  [alert setInformativeText:@"Hello, World!"];
  [alert setAlertStyle:NSAlertStyleCritical];
  [alert addButtonWithTitle:@"OK"];
  //[alert addButtonWithTitle:@"Cancel"];

//http://wiki.gnustep.org/index.php/NSAlert
#if (__APPLE__)
  [alert beginSheetModalForWindow:self completionHandler:^(NSModalResponse returnCode) {}];
#else
  NSInteger returnCode = [alert runModal]; 
  switch(returnCode) 
  { 
      case NSAlertFirstButtonReturn:
        NSLog(@"OK!");
        return;

      case NSAlertSecondButtonReturn:
        NSLog(@"Candel");

  }
#endif
}
- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return NO;
}
@end

int main(int argc, char* argv[]) {

  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
