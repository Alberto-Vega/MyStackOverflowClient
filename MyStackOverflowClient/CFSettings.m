//
//  CFSettings.m
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import "CFSettings.h"

@implementation CFSettings

#pragma mark - Class Methods
+(CFSettings *)sharedSettings {
    static CFSettings *sharedService;
        if (!sharedService) {
            sharedService = [[CFSettings alloc] init];
            return sharedService;
        }
        return sharedService;
}

#pragma mark - API Endpoint Settings
+(SOSearchSettings *)SOSearch {
    return [SOSearchSettings sharedService];
}

-(id)init {
    if (self = [super init]) {
        // Initialization code here
    }
    return self;
}

@end
