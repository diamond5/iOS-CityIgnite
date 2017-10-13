//
//  MyList.m
//  PianoClubHouse
//
//  Created by kingcode on 8/25/15.
//  Copyright (c) 2015 kingcode. All rights reserved.
//

#import "MyList.h"

@implementation MyList

@synthesize m_messageList;

static MyList *instance = nil;

+(MyList *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            instance= [MyList new];
        }
    }
    return instance;
}

@end
