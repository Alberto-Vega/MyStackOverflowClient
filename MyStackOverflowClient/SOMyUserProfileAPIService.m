//
//  SOMyUserProfileAPIService.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/19/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "SOMyUserProfileAPIService.h"
#import "JSONAPIRequestService.h"

@implementation SOMyUserProfileAPIService

+ (void)fetchMyProfileInfoWithCompletion:(kIdCompletionHandler)completion {
    NSString *searchURL = @"https://api.stackexchange.com/2.2/me";
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *accessToken = [userDefaults stringForKey:@"accessToken"];

    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:accessToken forKey:@"access_token"];
    [parameters setObject:@"vvVy9CfvAR)fSXpsRgP0vA((" forKey:@"key"];
    [parameters setObject:@"stackoverflow" forKey:@"site"];
    [parameters setObject:@"reputation" forKey:@"sort"];
    [parameters setObject:@"desc" forKey:@"order"];
    
    [JSONAPIRequestService getRequestWithURL:searchURL parameters:parameters withCompletion:^(id  _Nullable data, NSError * _Nullable error) {
        if (error != nil) {
            completion(nil, error);
            return ;
        }
        
        if ([data isKindOfClass:[NSDictionary class]]) {
            completion((NSDictionary * ) data, nil);
            return;
        }
        
        NSError *dictionaryError = [NSError errorWithDomain:@"TYPE ERROR: Converting response object to Dictionary" code:-1 userInfo:nil];
        completion(nil, dictionaryError);
    }];
}

@end
