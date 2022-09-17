
#import <time.h>

#import "Controller.h"

@implementation Controller

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
{
    window = [[Window alloc] init];
    [window setDelegate:self];
}

@end


