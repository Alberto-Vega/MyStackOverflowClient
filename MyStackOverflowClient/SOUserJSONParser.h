//
//  SOUserJSONParser.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/19/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOUserJSONParser : NSObject

+ (void)parseMyUserInfoFromDictionary: (NSDictionary *)dictionary completion:(kUserCompletionHandler)completion;
@end
