//
//  OAuthWebViewController.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/7/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^OAuthWebViewControllerCompletion)();

@interface OAuthWebViewController : UIViewController

@property (copy, nonatomic) OAuthWebViewControllerCompletion completion;

@end
