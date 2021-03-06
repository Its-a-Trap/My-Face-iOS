//
//  IATAppDelegate.m
//  Its A Trap
//
//  Created by Carlton Keedy on 5/7/14.
//  Copyright (c) 2014 Its-A-Trap. All rights reserved.
//

#import "IATAppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import <GoogleMaps/GoogleMaps.h>
#import "IATAppDelegateProtocol.h"
#import "IATDataObject.h"

@implementation IATAppDelegate

@synthesize window;
@synthesize theAppDataObject;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FBLoginView class];
    [GMSServices provideAPIKey:@"AIzaSyBbLe14wWwMF04uRidku2JJ7wdwDmI6P4Y"];
    
    [self.window addSubview:[navigationController view]];
    [self.window makeKeyAndVisible];
    return YES;
}

-(BOOL)application: (UIApplication*)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    BOOL wasHandled = [FBAppCall handleOpenURL:url
                             sourceApplication:sourceApplication];
    return wasHandled;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (id) init;
{
	self.theAppDataObject = [[IATDataObject alloc] init];
	return [super init];
}



@end
