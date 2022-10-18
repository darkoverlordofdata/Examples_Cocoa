#import "Controller.h"

@implementation Controller

- (void) applicationWillFinishLaunching: (NSNotification *)aNotification;
{

}

- (void) applicationDidFinishLaunching: (NSNotification *) not
{
    window = [Window new];
    [window setDelegate:self];
}

@end