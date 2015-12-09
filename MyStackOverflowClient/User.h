//
//  User.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/8/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface User : NSObject
@property NSString *displayName;
@property NSURL *profileImageURL;
@property UIImage *profileImage;
@property NSURL *link;
@property int reputation;
@property int userID;
@property int acceptRate;

- (id)initWithDisplayName:(NSString*)displayName profileImageURL:(NSURL *)profileImageURL link:(NSURL*)link reputation:(int)reputation userID:(int)userID acceptRate:(int)acceptRate;

@end
