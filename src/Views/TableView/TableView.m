#include <Cocoa/Cocoa.h>
#import "../../../NSPatch/NSPatch.h"
/**
 * @see https://stackoverflow.com/questions/4599747/programmatically-creating-an-nstableview-trouble-getting-the-nsheaderview-to-sh
 */
@interface Window : NSWindow {
  NSTextField* label;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Window
- (instancetype)init {
  [super initWithContentRect:NSMakeRect(0, 0, 380, 200) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"TableView"];

  // create a table view and a scroll view
  NSScrollView * tableContainer = [[NSScrollView alloc] initWithFrame:NSMakeRect(10, 10, 380, 200)];
  NSTableView * tableView = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 0, 364, 200)];
  // create columns for our table
  NSTableColumn * column1 = [[NSTableColumn alloc] initWithIdentifier:@"Col1"];
  NSTableColumn * column2 = [[NSTableColumn alloc] initWithIdentifier:@"Col2"];
  [column1 setWidth:252];
  [column2 setWidth:198];
  // generally you want to add at least one column to the table view.
  [tableView addTableColumn:column1];
  [tableView addTableColumn:column2];
  [tableView setDelegate:self];
  [tableView setDataSource:self];
  [tableView reloadData];
  // embed the table view in the scroll view, and add the scroll view
  // to our window.
  [tableContainer setDocumentView:tableView];
  [tableContainer setHasVerticalScroller:YES];
  [[self contentView] addSubview:tableContainer];
  [tableContainer release];
  [tableView release];
  [column1 release];
  [column2 release];

  [self center];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (int)numberOfRowsInTableView:(NSTableView *)aTableView
{
printf("NUM ROwS");
    return 4;
}
- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn    *)aTableColumn row:(NSInteger)rowIndex
{
 printf("THE OTHER ONE"); 
 return @"OKAY";
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
