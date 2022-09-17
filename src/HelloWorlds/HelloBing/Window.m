#import <Cocoa/Cocoa.h>
#import "Window.h"

@implementation Window
- (instancetype)init {

	[NSApp setMainMenu:[[[NSMenu alloc] init] autorelease]];

	[[NSApp mainMenu] setSubmenu: [NSMenu new] forItem:[[NSApp mainMenu] addItemWithTitle: NSLocalizedString(@"File", @"") action:NULL keyEquivalent: @""]];
	[[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Get POD"] , nil) action:@selector(fileGetPOD:) keyEquivalent:@""] autorelease]];
	[[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Open"] , nil) action:@selector(fileOpen:) keyEquivalent:@""] autorelease]];
	[[[[NSApp mainMenu] itemArray][1] submenu] addItem:[NSMenuItem separatorItem]];
	[[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Save"] , nil) action:@selector(fileSave:) keyEquivalent:@""] autorelease]];
	[[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Close"] , nil) action:@selector(fileClose:) keyEquivalent:@""] autorelease]];
	[[[[NSApp mainMenu] itemArray][1] submenu] addItem:[NSMenuItem separatorItem]];
	[[[[NSApp mainMenu] itemArray][1] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"Quit"] , nil) action:@selector(terminate:) keyEquivalent:@"q"] autorelease]];

	[[NSApp mainMenu] setSubmenu: [NSMenu new] forItem:[[NSApp mainMenu] addItemWithTitle: NSLocalizedString(@"Help", @"") action:NULL keyEquivalent: @""]];
	[[[[NSApp mainMenu] itemArray][2] submenu] addItem:[[[NSMenuItem alloc] initWithTitle:NSLocalizedString([NSString stringWithUTF8String:"About"] , nil) action:@selector(orderFrontStandardAboutPanel:) keyEquivalent:@"o"] autorelease]];


  pictureBox1 = [[[NSImageView alloc] initWithFrame:NSMakeRect(10, 10, 280, 280)] autorelease];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Bing Picture Of the Day"];
  [[self contentView] addSubview:pictureBox1];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}

- (void)fileNew:(id)sender {
  	NSLog(@"MainMenu/File/New");
}

- (void)fileOpen:(id)sender {
  	NSLog(@"MainMenu/File/New");
}

- (void)fileGetPOD:(id)sender {
      NSLog(@"MainMenu/File/GetPOD");

      NSString *bingUrl= @"https://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1&mkt=en-US";
      NSURL *url = [NSURL URLWithString:bingUrl]; 
      NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url                
        cachePolicy:NSURLRequestReloadIgnoringCacheData  
          timeoutInterval:60]; 

      NSURLResponse *response = nil; 
      NSError *error = nil; 
      NSError *jsonErr = nil; 

      NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error]; 

      NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonErr];

      NSArray *images = [json valueForKey:@"images"];
      NSDictionary *image = [images objectAtIndex: 0];
      NSString *imageUrl = [image valueForKey:@"url"];
      // NSString *name = [image valueForKey:@"copyright"];
      // NSString *title = [image valueForKey:@"title"];


      NSURL *baseUrl = [NSURL URLWithString:@"https://www.bing.com"];
      NSURL *fullUrl = [NSURL URLWithString:imageUrl relativeToURL:baseUrl];

      NSLog(@"fullUrl = %@", fullUrl.absoluteString);


      NSImage *img = [[NSImage alloc] initWithContentsOfURL:fullUrl];
      [pictureBox1 setImage:img];
      [pictureBox1 setImageFrameStyle:(NSImageFrameGrayBezel)];

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

@end

