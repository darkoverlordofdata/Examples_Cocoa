#include <Cocoa/Cocoa.h>
#import "../../../NSPatch/NSPatch.h"

@interface Window : NSWindow  {
  NSComboBox* comboBox1;
  NSComboBox* comboBox2;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  comboBox1 = [[NSComboBox alloc] initWithFrame:NSMakeRect(10, 260, 121, 26)];
  [comboBox1 addItemWithObjectValue:@"Apple"];
  [comboBox1 addItemWithObjectValue:@"Pear"];
  [comboBox1 addItemWithObjectValue:@"Lemon"];
  [comboBox1 setTarget:self];
  [comboBox1 setEditable:YES];
  [comboBox1 setCompletes:YES];
  [comboBox1 scrollItemAtIndexToTop:1];
  [comboBox1 setStringValue:@"Pear"];
  // [comboBox1 selectItemAtIndex:1];
  // [comboBox1 scrollItemAtIndexToVisible:1];
  // [[comboBox1 delegate] comboBoxSelectionIsChanging: ];
  // [comboBox1 setDelegate:self];
  [comboBox1 setAction:@selector(OnComboBox1SelectedItemChange)];
  
  comboBox2 = [[NSComboBox alloc] initWithFrame:NSMakeRect(10, 220, 121, 26)];
  // [comboBox2 setEditable:false];
  [comboBox2 addItemWithObjectValue:@"item1"];
  [comboBox2 addItemWithObjectValue:@"item2"];
  [comboBox2 addItemWithObjectValue:@"item3"];
  [comboBox2 setTarget:self];
  [comboBox2 setAction:@selector(OnComboBox2SelectedItemChange)];
  [comboBox2 selectItemAtIndex:1];
  [comboBox2 scrollItemAtIndexToVisible: 1];
  [comboBox2 setCompletes: YES];
  
  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"ComboBox Example"];
  [[self contentView] addSubview:comboBox1];
  [[self contentView] addSubview:comboBox2];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (IBAction) OnComboBox1SelectedItemChange:(id)sender {
  NSLog(@"Combo box 1 ");
  [comboBox1 selectItemAtIndex:[comboBox2 indexOfSelectedItem]];
}

- (IBAction) OnComboBox2SelectedItemChange:(id)sender {
  NSLog(@"Combo box 2 ");
  [comboBox2 selectItemAtIndex:[comboBox1 indexOfSelectedItem]];
}

- (void)OnComboBox1SelectionIsChanging:(NSNotification *)notification {
  
}
- (void)comboBoxSelectionIsChanging:(NSNotification *)notification {
  
}

@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}


