//
//  ImageFetcherService.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/9/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constants.h"

@interface ImageFetcherService : NSObject
+(void)fetchImageInBackgroundFromUrl:(NSURL * _Nonnull)url completionHandler:(kNSImageCompletionHandler)completionHandler;

@end
