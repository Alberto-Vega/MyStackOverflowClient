//
//  SOMyQuestionsAPIService.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/8/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "SOMyQuestionsAPIService.h"
#import "JSONAPIRequestService.h"

@implementation SOMyQuestionsAPIService

+ (void)fetchMyQuestions:(int)page completion:(kNSDictionaryCompletionHandler)completion
{
    NSString *searchURL = @"https://api.stackexchange.com/2.2/me/questions";
    
    NSString *pageNumber = (page < 1 ? pageNumber = @"1" : [NSString stringWithFormat:@"%i", page]);
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
//    [parameters setObject:[KeychainService loadFromKeychain] forKey:@"access_token"];
    [parameters setObject:@"7YhjPpWyOPT97JvXSMUjwA((" forKey:@"key"];
    [parameters setObject:pageNumber forKey:@"page"];
    [parameters setObject:@"stackoverflow" forKey:@"site"];
    [parameters setObject:@"activity" forKey:@"sort"];
    [parameters setObject:@"desc" forKey:@"order"];
    
    //    NSLog(@"%@?access_token=%@&key=7YhjPpWyOPT97JvXSMUjwA((&page=1&site=stackoverflow&sort=activity&order=desc", searchURL, [KeychainService loadFromKeychain]);
    
    [JSONAPIRequestService getRequestWithURL:searchURL parameters:parameters withCompletion:^(id  _Nullable data, NSError * _Nullable error) {

        if (error) {
            completion(nil, error);
            return;
        }
        if ([data isKindOfClass:[NSDictionary class]]) {
            NSDictionary *results = (NSDictionary *)data;
            completion(results, nil);
            return;
        } else {
            NSError *wrongTypeError = [NSError errorWithDomain:[NSString stringWithFormat:@"GET request returned unexpected datatype: %@", [data class]] code:11 userInfo:nil];
            completion(nil, wrongTypeError);
            return;
        }
    }];
}
@end