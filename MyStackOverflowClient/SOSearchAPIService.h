//
//  SOSearchAPIService.h
//  MyStackOverflowClient
//
//  Created by Alberto Vega Gonzalez on 12/8/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

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

@interface SOSearchAPIService : NSObject

@property Sort sort;
@property Order order;

+ (SOSearchAPIService * _Nonnull) sharedServide;

- (void) searchWithTerm:(NSString * _Nonnull)searchTermParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

- (void) searchWithTerm:(NSString * _Nonnull)searchTerm pageNumber:(int)pageNumber withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

- (void) searchSimilarWithTerm: (NSString * _Nonnull)searchTermParam pageNumber:(int)pageNumberParam withCompletion:(kNSDictionaryCompletionHandler _Nonnull)completionHandler;

@end
