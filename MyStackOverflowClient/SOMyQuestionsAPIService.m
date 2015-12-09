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
+(void) fetchMyQuestionsWithCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler {
    
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    [parameters setObject:@"1" forKey:@"page"];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *accessToken = [defaults stringForKey:@"accessToken"];
    
    NSLog(@"accessToken: %@", accessToken);
}
@end
