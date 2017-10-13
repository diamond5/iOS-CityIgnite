//
//  AppDelegate.m
//  City Ignite
//
//  Created by eden on 4/3/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import "AppDelegate.h"
#import "MyList.h"
#import "SerialObject.h"
#import "MessageData.h"
#import <OneSignal/OneSignal.h>
#import "MessageViewController.h"
#import "MainViewController.h"

#define MESSAGE_LIST @"MessageList"

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    
    
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10.0")){
        UNUserNotificationCenter *notifiCenter = [UNUserNotificationCenter currentNotificationCenter];
        notifiCenter.delegate = self;
        [notifiCenter requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error){
            if( !error ){
                [[UIApplication sharedApplication] registerForRemoteNotifications];
            }
        }];
    }

    
    [OneSignal setLogLevel:ONE_S_LL_VERBOSE visualLevel:ONE_S_LL_WARN];
    
    id notificationReceiverBlock = ^(OSNotification *notification) {
        NSLog(@"Received Notification - %@", notification.payload.notificationID);
        
        NSString* title = [notification.payload.body copy];
        NSString* content = @"";
        if (notification.payload.additionalData) {
            
            NSDictionary* additionalData = notification.payload.additionalData;
            
            if (additionalData[@"inMsg"])
                content = [additionalData valueForKey:@"inMsg"];
        }
        
        NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
        NSLog(@"%@",[dateFormatter stringFromDate:[NSDate date]]);
        NSString* received_date = [dateFormatter stringFromDate:[NSDate date]];
        
        MessageData* messageData = [[MessageData alloc] init];
        messageData.title = title;
        messageData.content = content;
        messageData.received_date = received_date;
        
        MyList* gList = [MyList getInstance];
        if(gList.m_messageList == nil){
            gList.m_messageList = [[NSMutableArray alloc] init];
        }
        
        [gList.m_messageList addObject:messageData];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"DidEnterForeground" object:self];
        
    };
    
    id notificationOpenedBlock = ^(OSNotificationOpenedResult *result) {
        // This block gets called when the user reacts to a notification received
        OSNotificationPayload* payload = result.notification.payload;
              
        NSString* messageTitle = @"City Ignite";
        NSString* fullMessage = [payload.body copy];
        
        if (payload.additionalData) {
            
            if(payload.title)
                messageTitle = payload.title;
            
            NSDictionary* additionalData = payload.additionalData;
            
            if (additionalData[@"inMsg"])
                fullMessage = [additionalData valueForKey:@"inMsg"];
        }
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:messageTitle message:fullMessage preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        
        [self.window.rootViewController presentViewController:alertController animated:YES completion:nil];

        
    };
    
    id onesignalInitSettings = @{kOSSettingsKeyInFocusDisplayOption : @(OSNotificationDisplayTypeNotification), kOSSettingsKeyAutoPrompt : @YES};
    
    [OneSignal initWithLaunchOptions:launchOptions
                               appId:@"040359e0-ea8c-4e5f-950a-e0e9eec62f7d"
          handleNotificationReceived:notificationReceiverBlock
            handleNotificationAction:notificationOpenedBlock
                            settings:onesignalInitSettings];
    
    MyList* g_list = [MyList getInstance];
    g_list.m_messageList = [NSMutableArray arrayWithArray:[SerialObject readFromUserDefaults:MESSAGE_LIST]];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    MyList* g_list = [MyList getInstance];
    [SerialObject writeToUserDefaults:MESSAGE_LIST withArray:g_list.m_messageList];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DidEnterForeground" object:self];
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
   
}


@end
