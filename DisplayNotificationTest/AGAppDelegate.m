//
//  AGAppDelegate.m
//  DisplayNotificationTest
//
//  Created by 中島進 on 2013/10/30.
//  Copyright (c) 2013年 @Angelworm_. All rights reserved.
//

#import "AGAppDelegate.h"

#import <ApplicationServices/ApplicationServices.h>


void MyDisplayReconfigurationCallBack (
                                       CGDirectDisplayID display,
                                       CGDisplayChangeSummaryFlags flags,
                                       void *userInfo)
{
    CGDisplayChangeSummaryFlags capture = kCGDisplayDesktopShapeChangedFlag;
        //kCGDisplayAddFlag | kCGDisplayRemoveFlag;
    if (flags & capture && CGMainDisplayID() == display ) {
        NSLog(@"desktop shape has changed");
        NSUserNotification *not = [[NSUserNotification alloc] init];
        not.title = @"DisplayNotificationTest";
        not.informativeText = @"desktop shape has changed";
        
        [[NSUserNotificationCenter defaultUserNotificationCenter]
         deliverNotification:not];
    }
}

@implementation AGAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    CGDisplayRegisterReconfigurationCallback(MyDisplayReconfigurationCallBack, NULL);
}

@end
