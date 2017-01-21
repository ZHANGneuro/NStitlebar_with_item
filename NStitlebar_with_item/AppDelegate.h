//
//  AppDelegate.h
//  NStitlebar_with_item
//
//  Created by boo on 15/01/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate>


@property (strong) IBOutlet NSWindow *window;
@property (strong) IBOutlet NSView *titlebar;
@property (strong) IBOutlet NSButton *OpenSideBar;
@property (strong) NSTitlebarAccessoryViewController *dummyTitlebarAccessoryViewController;

@end

