//
//  SOSearchSettings.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    Activity,
    Votes,
    Creation,
    Relevance
} Sort;

typedef enum {
    Descending,
    Ascending
} Order;

@interface SOSearchSettings : NSObject
@property Sort sort;
@property Order order;

+ (SOSearchSettings * _Nonnull) sharedService;

- (NSString * _Nonnull) getSortParameterForUrl;
- (NSString * _Nonnull) getSortParameterForUrl;

@end
