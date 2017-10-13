//
//  MessageData.m
//  City Ignite
//
//  Created by Super on 4/10/17.
//  Copyright © 2017 dmc. All rights reserved.
//

#import "MessageData.h"

@implementation MessageData

@synthesize title;
@synthesize content;
@synthesize received_date;

- (void)encodeWithCoder:(NSCoder *)coder;
{
    [coder encodeObject:title forKey:@"title"];
    [coder encodeObject:content forKey:@"content"];
    [coder encodeObject:received_date forKey:@"received_date"];
}

- (id)initWithCoder:(NSCoder *)coder;
{
    self = [super init];
    if (self != nil)
    {
        title = [coder decodeObjectForKey:@"title"];
        content = [coder decodeObjectForKey:@"content"];
        received_date = [coder decodeObjectForKey:@"received_date"];
    }
    return self;
}


@end
