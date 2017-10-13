//
//  AppDelegate.h
//  City Ignite
//
//  Created by eden on 4/3/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 100000
#import <UserNotifications/UserNotifications.h>
#endif

@interface AppDelegate : UIResponder <UIApplicationDelegate, UNUserNotificationCenterDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

