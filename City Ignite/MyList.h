//
//  MyList.h
//  PianoClubHouse
//
//  Created by kingcode on 8/25/15.
//  Copyright (c) 2015 kingcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyList : NSObject {
    
    NSMutableArray *m_messageList;
}

@property(nonatomic,retain)NSMutableArray *m_messageList;

+(MyList*)getInstance;

@end
