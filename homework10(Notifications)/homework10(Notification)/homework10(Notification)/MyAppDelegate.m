//
//  MyAppDelegate.m
//  homework10(Notification)
//
//  Created by Алексей on 01/05/2019.
//  Copyright © 2019 Aleksey Suslov. All rights reserved.
//

#import "MyAppDelegate.h"
#import <UIKit/UIKit.h>

@implementation MyAppDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didFinishLaunchingNotification)
                                                     name:UIApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(willResignActiveNotification)
                                                     name:UIApplicationWillResignActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didEnterBackgroundNotification)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(willEnterForegroundNotification)
                                                     name:UIApplicationWillEnterForegroundNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didBecomeActiveNotification)
                                                     name:UIApplicationDidBecomeActiveNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(willTerminateNotification)
                                                     name:UIApplicationWillTerminateNotification
                                                   object:nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)didFinishLaunchingNotification {
    NSLog(@"DidFinishLaunchingNotification - NOTIFICATION");
    return YES;
}

- (void)willResignActiveNotification {
    NSLog(@"WillResignActiveNotification - NOTIFICATION");
}

- (void)didEnterBackgroundNotification {
    NSLog(@"DidEnterBackgroundNotification - NOTIFICATION");
}

- (void)willEnterForegroundNotification {
    NSLog(@"WillEnterForegroundNotification - NOTIFICATION");
}

- (void)didBecomeActiveNotification {
    NSLog(@"DidBecomeActiveNotification - NOTIFICATION");
}

- (void)willTerminateNotification {
    NSLog(@"WillTerminateNotification - NOTIFICATION");
}

@end
