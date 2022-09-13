#include <Cocoa/Cocoa.h>

//https://github.com/thezerobit/gnustep-gui-sony/tree/master/Source

@interface Window : NSWindow {
  NSButton* button1;
  NSButton* button2;
  NSTextField* label1;
  NSTextField* label2;
  int button1Clicked;
  int button2Clicked;
}

- (instancetype) init;
- (BOOL)windowShouldClose:(id)sender;
- (IBAction) OnButton1Click:(id)sender;
- (IBAction) OnButton2Click:(id)sender;
@end

//https://developer.apple.com/documentation/appkit/nsbezelstyle?language=objc

// typedef enum NSBezelStyle : NSUInteger {
//     ...
// } NSBezelStyle;

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


@implementation Window
- (instancetype) init {
  button1Clicked = 0;
  button2Clicked = 0;

  button1 = [[[NSButton alloc] initWithFrame:NSMakeRect(50, 225, 90, 25)] autorelease];
  [button1 setTitle:@"button1"];
  [button1 setBezelStyle:NSBezelStyleRounded];
  [button1 setTarget:self];
  [button1 setAction:@selector(OnButton1Click:)];
  [button1 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  button2 = [[[NSButton alloc] initWithFrame:NSMakeRect(50, 125, 200, 75)] autorelease];
  [button2 setTitle:@"button2"];
  [button2 setBezelStyle:NSBezelStyleRegularSquare];
  [button2 setTarget:self];
  [button2 setAction:@selector(OnButton2Click:)];
  [button2 setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];
  
  label1 = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 80, 150, 20)];
  [label1 setStringValue:@"button1 clicked 0 times"];
  [label1 setBezeled:NO];
  [label1 setDrawsBackground:NO];
  [label1 setEditable:NO];

  label2 = [[NSTextField alloc] initWithFrame:NSMakeRect(50, 50, 150, 20)];
  [label2 setStringValue:@"button2 clicked 0 times"];
  [label2 setBezeled:NO];
  [label2 setDrawsBackground:NO];
  [label2 setEditable:NO];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Button example"];
  [[self contentView] addSubview:button1];
  [[self contentView] addSubview:button2];
  [[self contentView] addSubview:label1];
  [[self contentView] addSubview:label2];
  [self setIsVisible:YES];

  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (IBAction) OnButton1Click:(id)sender {
  [label1 setStringValue:[NSString stringWithFormat:@"button1 clicked %d times", ++button1Clicked]];
}

- (IBAction) OnButton2Click:(id)sender {
  [label2 setStringValue:[NSString stringWithFormat:@"button2 clicked %d times", ++button2Clicked]];
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
