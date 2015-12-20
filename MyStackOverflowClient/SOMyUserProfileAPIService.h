//
//  SOMyUserProfileAPIService.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/19/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface SOMyUserProfileAPIService : NSObject

+ (void)fetchMyProfileInfoWithCompletion: (kIdCompletionHandler)completion;

@end
