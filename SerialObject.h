//
//  SerialObject.h
//  PianoClubHouse
//
//  Created by kingcode on 8/25/15.
//  Copyright (c) 2015 kingcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SerialObject : NSObject

+(void)writeToUserDefaults:(NSString *)keyName withArray:(NSMutableArray *)myArray;
+(NSArray *)readFromUserDefaults:(NSString*)keyName;

@end
