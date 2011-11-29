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

//  |chooseSource| is the action that responds to the |Source...| button of the
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
            NSURL * pathToEnumerate=[filePaths objectAtIndex:0];            
            [self enumerateDirectory:pathToEnumerate];
        }
    };
    [sourceSelectPanel beginSheetModalForWindow:_window completionHandler:handler];
}


// |enumerateDirectory| uses an NSFileManager to generate an enumerator
// containing the contents of the directory at the path passed in.
- (void)enumerateDirectory:(NSURL *)url{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *dirEnum;
    // error handler for the enumeration process.  Always return NO (stop enumeration)
    // eventually this would pop up a warning window asking for continue/cancel
    BOOL (^enumerationErrorHandler)(NSURL*, NSError*) = ^(NSURL *badURL, NSError *error){
        NSLog(@"error!");
        NSLog(@"Error occurred at %@",badURL);
        return NO;
    };
    // note - expand enumeratorAtURL to take advantage of propertiesForKeys
    // enumerator skips hidden files
    dirEnum = [fileManager enumeratorAtURL:url includingPropertiesForKeys:nil options:NSDirectoryEnumerationSkipsHiddenFiles errorHandler:enumerationErrorHandler];
 
    NSURL *path;
    while ((path = [dirEnum nextObject]) != nil){
        NSLog(@"%@",path);
        }
}

@end
