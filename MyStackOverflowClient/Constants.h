//
//  Constants.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/8/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^kNSDataCompletionHandler)(NSData * _Nullable data , NSError * _Nullable error);
typedef void (^kNSDictionaryCompletionHandler)(NSDictionary * _Nullable data, NSError * _Nullable error);
typedef void (^kNSArrayCompletionHandler)(NSArray *_Nullable data , NSError *_Nullable error);
typedef void (^kNSImageCompletionHandler)(UIImage * _Nullable data , NSError * _Nullable error);
