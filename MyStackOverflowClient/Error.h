//
//  Error.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/7/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const kStackOverFlowErrorDomain;

typedef enum: NSUInteger {
    StackOverFlowBadJSON,
    StackOverFlowConnectionDown,
    StackOverFlowTooManyAttempts,
    StackOverFlowInvalidParameter,
    StackOverFlowNeedAuthentication,
    StackOverFlowGeneralError
    } StackOverFlowErrorCodes;
