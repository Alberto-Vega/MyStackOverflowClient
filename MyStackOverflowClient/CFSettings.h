//
//  CFSettings.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SOSearchSettings.h"

@interface CFSettings : NSObject
@property SOSearchSettings *SOsearch;

+(CFSettings * _Nonnull) sharedSettings;

@end
