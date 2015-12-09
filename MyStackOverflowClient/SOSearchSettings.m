//
//  SOSearchSettings.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "SOSearchSettings.h"

@implementation SOSearchSettings

#pragma mark - class methods

+(SOSearchSettings *)sharedService {
    static SOSearchSettings *sharedService;
    if (!sharedService) {
        sharedService = [[SOSearchSettings alloc]init];
        return sharedService;
    }
    return sharedService;
}

#pragma mark - instance methods

-(id)init {
    
    if (self = [super init]) {
        
        [self setSort:Activity];
        [self setOrder:Descending];
    }
    return self;
}

-(NSString *) getSortParameterForUrl {
    switch (self.sort) {
        case Activity:
            return @"activity";
            break;
        case Creation:
            return @"creation";
            break;
        case Relevance:
            return @"relevance";
            break;
        case Votes:
            return @"votes";
            break;
        default:
            return @"activity";
            break;
    }
}

-(NSString *) getOrderParameterForUrl{
    switch (self.order) {
        case Descending:
            return @"desc";
            break;
        case Ascending:
            return @"asc";
            break;
        default:
            return @"desc";
            break;
    }
}


@end
