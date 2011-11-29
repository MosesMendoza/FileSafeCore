//
//  AppDelegate.m
//  FileSafeCore
//
//  Created by Moses Mendoza 11/29/11.
//  Copyright (c) 2011 Atlas Developers LLC. All rights reserved.
//
//  

#import "AppDelegate.h"

@implementation AppDelegate
@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification{
}

//  chooseSource is the action that responds to the |Source...| button of the
//  the main window inteface. The NSOpenPanel allows user to select a 
//  directory path(s) or file(s) to be summed
- (IBAction)chooseSource:(id)sender {

    NSOpenPanel *sourceSelectPanel = [NSOpenPanel openPanel];
    [sourceSelectPanel setCanChooseDirectories:TRUE];
    [sourceSelectPanel setAllowsMultipleSelection:TRUE];
    
    void(^handler)(NSInteger) = ^(NSInteger result){
        if(result == NSFileHandlingPanelOKButton){
            NSArray *filePaths = [sourceSelectPanel URLs];
            NSLog(@"Paths selected: %@",filePaths);
        }
    };

    [sourceSelectPanel beginSheetModalForWindow:_window completionHandler:handler];

}
@end
