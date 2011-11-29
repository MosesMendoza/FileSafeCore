//
//  AppDelegate.h
//  FileSafeCore
//
//  Created by mo on 11/29/11.
//  Copyright (c) 2011 Atlas Developers LLC. All rights reserved.
//
// AppDelegate for FileSafeCore
// FileSafeCore contains the core functionality of the FileSafeManager
// The AppDelegate is a proving ground/test bed for the various functions
// that will eventually make it into the FileSafeManager
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
- (IBAction)chooseSource:(id)sender;

@end
