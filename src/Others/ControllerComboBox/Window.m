#import "Window.h"

@implementation Window
- (instancetype)init {
  comboBox1 = [[NSComboBox alloc] initWithFrame:NSMakeRect(10, 260, 121, 26)];
  [comboBox1 addItemWithObjectValue:@"item1"];
  [comboBox1 addItemWithObjectValue:@"item2"];
  [comboBox1 addItemWithObjectValue:@"item3"];
  [comboBox1 setTarget:self];
  // [comboBox1 reloadData];
  //[[comboBox1 delegate] comboBoxSelectionIsChanging: ];
  // [comboBox1 setDelegate:self];
  [comboBox1 selectItemAtIndex:0];
  
  comboBox2 = [[NSComboBox alloc] initWithFrame:NSMakeRect(10, 220, 121, 26)];
  [comboBox2 setEditable:false];
  [comboBox2 addItemWithObjectValue:@"item1"];
  [comboBox2 addItemWithObjectValue:@"item2"];
  [comboBox2 addItemWithObjectValue:@"item3"];
  [comboBox2 setTarget:self];
  // [comboBox1 reloadData];
  //[comboBox2 setAction:@selector(OnComboBox2SelectedItemChange)];
  [comboBox2 selectItemAtIndex:1];
  
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
  [comboBox2 selectItemAtIndex:[comboBox1 indexOfSelectedItem]];
}

- (IBAction) OnComboBox2SelectedItemChange:(id)sender {
  [comboBox1 selectItemAtIndex:[comboBox2 indexOfSelectedItem]];
}

- (void)OnComboBox1SelectionIsChanging:(NSNotification *)notification {
  
}
- (void)comboBoxSelectionIsChanging:(NSNotification *)notification {
  
}

@end

