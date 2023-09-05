#include <Cocoa/Cocoa.h>
#import "../../../NSPatch/NSPatch.h"



@interface Window : NSWindow {
}
- (instancetype)init;
- (void)fileNew:(id)sender;
- (void)fileOpen:(id)sender;
- (void)fileClose:(id)sender;
- (void)editUndo:(id)sender;
- (void)editRedo:(id)sender;
- (void)editCut:(id)sender;
- (void)editCopy:(id)sender;
- (void)editPaste:(id)sender;
- (void)editDelete:(id)sender;
- (void)editSelectAll:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end

#define __EXPERIMENTAL__
#ifdef __EXPERIMENTAL__
NSMenuItem *addItemToMenu(NSMenu *menu, NSString *str, 
																NSString *comm, NSString *sel, NSString *key)
{
	NSMenuItem *item = (NSMenuItem *) [menu addItemWithTitle: NSLocalizedString(str, comm)
												action: NSSelectorFromString(sel) keyEquivalent: key]; 
	return item;
}
#endif

@implementation Window

- (instancetype)init {

#ifdef __EXPERIMENTAL__
	NSMenu *mainmenu;
	NSMenu *menu;
	id<NSMenuItem> menuItem;
	
	// Main
	mainmenu = AUTORELEASE ([[NSMenu alloc] initWithTitle: @"Main Menu"]);
	
	// Info 	
	menuItem = [mainmenu addItemWithTitle:@"Info" action:(SEL)nil keyEquivalent:@""];
	menu = [NSMenu new];
	[mainmenu setSubmenu: menu forItem: menuItem];
	RELEASE (menu);
	[menu addItemWithTitle:@"Info Panel..." action:NSSelectorFromString(@"orderFrontStandardInfoPanel:") keyEquivalent:@""];
	[menu addItemWithTitle:@"Help..." action:(SEL)nil keyEquivalent:@"?"]; 
  
	// Edit
	menuItem = [mainmenu addItemWithTitle:@"Edit" action:(SEL)nil keyEquivalent:@""];
	menu = [NSMenu new];
	[mainmenu setSubmenu: menu forItem: menuItem];	
	RELEASE (menu);
	[menu addItemWithTitle:@"Cut" action:NSSelectorFromString(@"cut:") keyEquivalent:@"x"];
	[menu addItemWithTitle:@"Copy" action:NSSelectorFromString(@"copy:") keyEquivalent:@"c"];
	[menu addItemWithTitle:@"Paste" action:NSSelectorFromString(@"paste:") keyEquivalent:@"v"];
	[menu addItemWithTitle:@"Select All" action:NSSelectorFromString(@"selectAll:") keyEquivalent:@"a"];
		
	// Windows
	menuItem = [mainmenu addItemWithTitle:@"Windows" action:(SEL)nil keyEquivalent:@""];
	menu = [NSMenu new];
	[mainmenu setSubmenu: menu forItem: menuItem];		
	RELEASE (menu);
	[menu addItemWithTitle:@"Arrange in Front" action:NSSelectorFromString(@"arrangeInFront:") keyEquivalent:@""];
	[menu addItemWithTitle:@"Miniaturize Window" action:NSSelectorFromString(@"performMiniaturize:") keyEquivalent:@"m"];
	[menu addItemWithTitle:@"Close Window" action:NSSelectorFromString(@"performClose:") keyEquivalent:@"w"];
  [[NSApplication sharedApplication] setWindowsMenu: menu];

	// Services 
	menuItem = [mainmenu addItemWithTitle:@"Services" action:(SEL)nil keyEquivalent:@""];
	menu = [NSMenu new];
	[mainmenu setSubmenu: menu forItem: menuItem];		
	RELEASE (menu);
	[[NSApplication sharedApplication] setServicesMenu: menu];

	// Hide
	[mainmenu addItemWithTitle:@"Hide" action:NSSelectorFromString(@"hide:") keyEquivalent:@"h"];
	[mainmenu addItemWithTitle:@"Hide Others" action:NSSelectorFromString(@"hideOtherApplications:") keyEquivalent:@"H"];
	[mainmenu addItemWithTitle:@"Show All" action:NSSelectorFromString(@"unhideAllApplications:") keyEquivalent:@""];
	
	// Quit
	[mainmenu addItemWithTitle:@"Quit" action:NSSelectorFromString(@"terminate:") keyEquivalent:@"q"];

	[[NSApplication sharedApplication] setMainMenu: mainmenu];		
  
  #else
    // Creates Application and asociate menubar and specific menus.
  [NSApplication sharedApplication];

	// Main
  [NSApp setMainMenu:[[NSMenu new]autorelease]];		

  [[[[NSApp mainMenu] itemArray][0] submenu] addItemWithTitle:@"About MainMenu" action:NSSelectorFromString(@"orderFrontStandardInfoPanel:") keyEquivalent:@""];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItemWithTitle:@"Preferences" action:NSSelectorFromString(@"") keyEquivalent:@""];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItemWithTitle:@"Services" action:NSSelectorFromString(nil) keyEquivalent:@""];

  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItemWithTitle:@"Hide MainMenu" action:NSSelectorFromString(@"hide:") keyEquivalent:@"h"];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItemWithTitle:@"Hide Others" action:NSSelectorFromString(@"hideOtherApplications:") keyEquivalent:@"H"];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItemWithTitle:@"Show All" action:NSSelectorFromString(@"unhideAllApplications:") keyEquivalent:@""];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][0] submenu] addItemWithTitle:@"Quit MainMenu" action:NSSelectorFromString(@"terminate:") keyEquivalent:@"w"];

	// File
  [[NSApp mainMenu] setSubmenu: [NSMenu new] forItem: [[NSApp mainMenu] addItemWithTitle:@"File" action:NULL keyEquivalent: @""]];
  [[[[NSApp mainMenu] itemArray][1] submenu] addItemWithTitle:@"Open" action:NSSelectorFromString(@"fileOpen:") keyEquivalent:@"o"];
  [[[[NSApp mainMenu] itemArray][1] submenu] addItem:[NSMenuItem separatorItem]];
  [[[[NSApp mainMenu] itemArray][1] submenu] addItemWithTitle:@"Close" action:NSSelectorFromString(@"fileClose:") keyEquivalent:@"w"];

	// Edit
  [[NSApp mainMenu] setSubmenu: [NSMenu new] forItem: [[NSApp mainMenu] addItemWithTitle:@"Edit" action:NULL keyEquivalent: @""]];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItemWithTitle:@"Cut" action:NSSelectorFromString(@"editCut:") keyEquivalent:@"x"];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItemWithTitle:@"Copy" action:NSSelectorFromString(@"editCopy:") keyEquivalent:@"c"];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItemWithTitle:@"Paste" action:NSSelectorFromString(@"editPaste:") keyEquivalent:@"v"];
  [[[[NSApp mainMenu] itemArray][2] submenu] addItemWithTitle:@"Select All" action:NSSelectorFromString(@"editSelectAll:") keyEquivalent:@"a"];		

	// Windows
  [[NSApp mainMenu] setSubmenu: [NSMenu new] forItem: [[NSApp mainMenu] addItemWithTitle:@"Windows" action:NULL keyEquivalent: @""]];
  [[[[NSApp mainMenu] itemArray][3] submenu] addItemWithTitle:@"Arrange in Front" action:NSSelectorFromString(@"windowArrangeInFront:") keyEquivalent:@""];
  [[[[NSApp mainMenu] itemArray][3] submenu] addItemWithTitle:@"Miniaturize Window" action:NSSelectorFromString(@"windowPerformMiniaturize:") keyEquivalent:@"m"];
  [[[[NSApp mainMenu] itemArray][3] submenu] addItemWithTitle:@"Close Window" action:NSSelectorFromString(@"windowPerformClose:") keyEquivalent:@"w"];

	// Help
  [[NSApp mainMenu] setSubmenu: [NSMenu new] forItem: [[NSApp mainMenu] addItemWithTitle:@"Help" action:NULL keyEquivalent: @""]];
  [[[[NSApp mainMenu] itemArray][4] submenu] addItemWithTitle:@"About MainMenu" action:NSSelectorFromString(@"orderFrontStandardInfoPanel:") keyEquivalent:@""];

#endif

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"MainMenu example"];
  [self setIsVisible:YES];
  return self;
}

- (void)fileNew:(id)sender {
  NSLog(@"MainMenu/File/New");
}

- (void)fileOpen:(id)sender {
  NSLog(@"MainMenu/File/Open");
}

- (void)fileClose:(id)sender {
  NSLog(@"MainMenu/File/Close");
}

- (void)editUndo:(id)sender {
  NSLog(@"MainMenu/Edit/Undo");
}

- (void)editRedo:(id)sender {
  NSLog(@"MainMenu/Edit/Redo");
}

- (void)editCut:(id)sender {
  NSLog(@"MainMenu/Edit/Cut");
}

- (void)editCopy:(id)sender {
  NSLog(@"MainMenu/Edit/Copy");
}

- (void)editPaste:(id)sender {
  NSLog(@"MainMenu/Edit/Paste");
}

- (void)editDelete:(id)sender {
  NSLog(@"MainMenu/Edit/Delete");
}

- (void)editSelectAll:(id)sender {
  NSLog(@"MainMenu/Edit/SelectAll");
}

- (void)windowArrangeInFront:(id)sender {
  NSLog(@"MainMenu/Window/ArrangeInFront");  
}

- (void)windowPerformMiniaturize:(id)sender {
  NSLog(@"MainMenu/Window/PerformMiniaturize");  
}

- (void)windowPerformClose:(id)sender {
  NSLog(@"MainMenu/Window/PerformClose");  
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Window alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
