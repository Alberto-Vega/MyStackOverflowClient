//
//  SOUserJSONParser.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/19/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "SOUserJSONParser.h"
#import "User.h"

@import UIKit;

@implementation SOUserJSONParser

+ (void)parseMyUserInfoFromDictionary:(NSDictionary *)dictionary completion:(kUserCompletionHandler)completion {if ([dictionary objectForKey:@"items"]) {
    NSDictionary *userData = [[dictionary objectForKey:@"items"] firstObject];
    if ([userData objectForKey:@"badge_counts"]) {
        
//        NSDictionary *badgeCountsObject = [userData objectForKey:@"badge_counts"];
//        NSString *bronze = [badgeCountsObject objectForKey:@"bronze"];
//        NSString *silver = [badgeCountsObject objectForKey:@"silver"];
//        NSString *gold = [badgeCountsObject objectForKey:@"gold"];
        NSString *reputation = [userData objectForKey:@"reputation"];
        NSString *userID = [userData objectForKey:@"user_id"];
//        NSString *userType = [userData objectForKey:@"user_type"];
        NSURL *profileImageURL = [NSURL URLWithString:[userData objectForKey:@"profile_image"]];
        NSString *displayName = [userData objectForKey:@"display_name"];
        NSURL *link = [NSURL URLWithString:[userData objectForKey:@"link"]];
        
        User *me = [[User alloc] initWithDisplayName: displayName profileImageURL: profileImageURL link: link reputation: reputation.intValue userID:userID.intValue];
        
//        MyUser *myUser = [[MyUser alloc] initWithDisplayName:displayName userId:userId.intValue reputation:reputation.intValue userType:userType profileImageURL:imageUrl link:link bronzeBadges:bronze.intValue silverBadges:silver.intValue goldBadges:gold.intValue];
        
        if (me) {
            completion(me, nil);
            return;
        }
    }
}
    NSError *error = [NSError errorWithDomain:@"Do you even exist!?!" code:2 userInfo:nil];
    completion(nil, error);
}

@end
