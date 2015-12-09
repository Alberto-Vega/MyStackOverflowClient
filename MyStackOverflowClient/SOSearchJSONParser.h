//
//  SOSearchJSONParser.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/8/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOSearchJSONParser : NSObject
+(void)questionsArrayFromDictionary:(NSDictionary*)dictionary completionHandler:(kNSArrayCompletionHandler)completionHandler;
@end
