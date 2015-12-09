//
//  User.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/8/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "User.h"

@implementation User

- (id)initWithDisplayName:(NSString *)displayName profileImageURL:(NSURL *)profileImageURL link:(NSURL *)link reputation:(int)reputation userID:(int)userID acceptRate:(int)acceptRate {
    
    if (self = [super init]) {
        
        [self setDisplayName:displayName];
        [self setProfileImageURL:profileImageURL];
        [self setLink:link];
        [self setReputation:reputation];
        [self setUserID:userID];
        [self setAcceptRate:acceptRate];
    }
    return self;
}

@end
