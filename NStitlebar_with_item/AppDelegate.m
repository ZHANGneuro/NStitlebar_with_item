//
//  AppDelegate.m
//  NStitlebar_with_item
//
//  Created by boo on 15/01/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize documentContentView,window,titlebar;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    int appheight = [[NSScreen mainScreen] frame].size.height*0.8;
    NSRect frame = NSMakeRect(50, 100, 420, 300);
    NSUInteger masks = NSTitledWindowMask | NSClosableWindowMask |NSMiniaturizableWindowMask | NSResizableWindowMask |NSBorderlessWindowMask;
    window = [[NSWindow alloc] initWithContentRect:frame styleMask:masks backing:NSBackingStoreBuffered defer:NO];
    [window makeKeyAndOrderFront:NSApp];
    
    [window setMaxSize:NSMakeSize(420, appheight)];
    [window setMinSize:NSMakeSize(420, appheight/2)];
    documentContentView = [[NSView alloc] initWithFrame:frame];
    [documentContentView setWantsLayer:YES];
    [window setContentView:documentContentView];
    window.backgroundColor = [NSColor colorWithCalibratedRed:(250/255.0f) green:(250/255.0f) blue:(250/255.0f) alpha:1.0];
    
    
    [[[window standardWindowButton:NSWindowCloseButton] superview] addSubview:titlebar];
    
    [self setTitleBarHeight];
}


- (void) setTitleBarHeight{
    
    //38-22=16
    NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 20, 16)];
    _dummyTitlebarAccessoryViewController = [NSTitlebarAccessoryViewController new];
    _dummyTitlebarAccessoryViewController.view = view;
    _dummyTitlebarAccessoryViewController.fullScreenMinHeight = 38;
    [window addTitlebarAccessoryViewController:_dummyTitlebarAccessoryViewController];
    
    
    NSView * themeframeview =[window.contentView superview];
    NSArray * get_containerview = themeframeview.subviews;
    NSView * containerview = [get_containerview objectAtIndex:1];
    
    NSArray * get_titlebarview = containerview.subviews;
    NSView * titlebarview = [get_titlebarview objectAtIndex:0];
    NSArray * get_elements = titlebarview.subviews;
    
    [[get_elements objectAtIndex:0] setFrame:NSMakeRect(12, 10, 14, 16)];
    [[get_elements objectAtIndex:1] setFrame:NSMakeRect(32, 10, 14, 16)];
    [[get_elements objectAtIndex:2] setFrame:NSMakeRect(52, 10, 14, 16)];
}



@end
