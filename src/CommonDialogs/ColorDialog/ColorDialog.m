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


@interface Window : NSWindow {
  NSButton* buttonShowMessage;
}
- (IBAction) OnButtonClick:(id)sender;
- (void)changeColor:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  buttonShowMessage = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 265, 100, 32)] autorelease];
  [buttonShowMessage setTitle:@"Color..."];
  [buttonShowMessage setBezelStyle:NSBezelStyleRounded];
  [buttonShowMessage setTarget:self];
  [buttonShowMessage setAction:@selector(OnButtonClick:)];
  [buttonShowMessage setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"ColorDialog example"];
  [[self contentView] addSubview:buttonShowMessage];
  [self setIsVisible:YES];
  return self;
}

- (IBAction) OnButtonClick:(id)sender {
  NSColorPanel* colorDialog = [NSColorPanel sharedColorPanel];
  [colorDialog setIsVisible:YES];
  [colorDialog setColor:[self backgroundColor]];
}

- (void)changeColor:(id)sender {
  [self setBackgroundColor:[(NSColorPanel*)sender color]];
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
