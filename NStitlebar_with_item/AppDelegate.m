//
//  AppDelegate.m
//  NStitlebar_with_item
//
//  Created by boo on 15/01/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize window,titlebar,OpenSideBar;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(window_resize:) name:NSWindowDidResizeNotification object:nil];

    
    //create a window
    int appheight = [[NSScreen mainScreen] frame].size.height*0.8;
    NSRect frame = NSMakeRect(50, 100, 420, 400);
    NSUInteger masks = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |NSWindowStyleMaskBorderless;
    window = [[NSWindow alloc] initWithContentRect:frame styleMask:masks backing:NSBackingStoreBuffered defer:NO];
    [window makeKeyAndOrderFront:NSApp];
    [window setMaxSize:NSMakeSize(420, appheight)];
    [window setMinSize:NSMakeSize(420, appheight/2)];
    
    // add a newview (fake toolbar view) on NStitlebarview
    [[[window standardWindowButton:NSWindowCloseButton] superview] addSubview:titlebar];
    
    
    //addTitlebarAccessoryViewController
    NSView *view = [[NSView alloc] initWithFrame:NSMakeRect(0, 0, 20, 16)];//16
    _dummyTitlebarAccessoryViewController = [NSTitlebarAccessoryViewController new];
    _dummyTitlebarAccessoryViewController.view = view;
    _dummyTitlebarAccessoryViewController.fullScreenMinHeight = 38;
    [window addTitlebarAccessoryViewController:_dummyTitlebarAccessoryViewController];
    
    [self adjust_traffic_light];
}



// change traffic light position
- (void) adjust_traffic_light{
    NSView * themeframeview =[window.contentView superview];
    NSArray * get_containerview = themeframeview.subviews;
    NSView * containerview = [get_containerview objectAtIndex:1];
    NSArray * get_titlebarview = containerview.subviews;
    NSView * titlebarview = [get_titlebarview objectAtIndex:0];
    NSArray * get_elements = titlebarview.subviews;
    [[get_elements objectAtIndex:0] setFrame:NSMakeRect(12, 10, 14, 16)];
    [[get_elements objectAtIndex:1] setFrame:NSMakeRect(32, 10, 14, 16)];
    [[get_elements objectAtIndex:2] setFrame:NSMakeRect(52, 10, 14, 16)];
    
    NSButton *sidebar_button = [[NSButton alloc] initWithFrame:NSMakeRect(76, 4, 45, 28)];
    [sidebar_button setButtonType:NSMomentaryPushInButton];
    [sidebar_button setBezelStyle:NSTexturedSquareBezelStyle];
    [sidebar_button setBordered:YES];
    [sidebar_button setImage:[NSImage imageNamed:NSImageNameTouchBarSidebarTemplate]];
    [sidebar_button setAction:@selector(sidebar_Clicked)];
    [titlebarview addSubview:sidebar_button];
    
    NSButton *back_button = [[NSButton alloc] initWithFrame:NSMakeRect(126, 4, 45, 28)];
    [back_button setButtonType:NSMomentaryPushInButton];
    [back_button setBezelStyle:NSTexturedSquareBezelStyle];
    [back_button setBordered:YES];
    [back_button setImage:[NSImage imageNamed:NSImageNameGoBackTemplate]];
    [back_button setAction:@selector(back_button_Clicked)];
    [titlebarview addSubview:back_button];
    

    
    

}



- (void) window_resize:(NSNotification *)notification{
    [self adjust_traffic_light];
}





-(void) sidebar_Clicked
{
    NSLog(@"sidebar_Clicked");
}
-(void) back_button_Clicked
{
    NSLog(@"back_button_Clicked");
}

@end
