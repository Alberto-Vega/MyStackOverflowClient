//
//  JSONAPIRequestService.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/8/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface JSONAPIRequestService : NSObject

+ (void) getRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary*)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler;
+ (void)postRequestWithURL: (NSString * _Nonnull)url parameters:(NSDictionary*_Nullable)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler;
+ (void)deleteRequestWithURL:(NSString * _Nonnull)url parameters:(NSDictionary*_Nullable)parameters withCompletion:(kNSDataCompletionHandler _Nonnull)completionHandler;

@end
