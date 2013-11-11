//
//  NKAppDelegate.m
//  AmIBlind
//
//  Created by Nikita Kolmogorov on 10.11.13.
//  Copyright (c) 2013 Nikita Kolmogorov. All rights reserved.
//

#import "NKAppDelegate.h"
#import "GAI.h"

@implementation NKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Initialize GA
    [[GAI sharedInstance] trackerWithTrackingId:@"UA-43367175-3"];
    
    return YES;
}

@end
