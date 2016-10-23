//
//  HttpRequests.h
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>
#import "Movie.h"

@interface HttpRequests : NSObject

extern NSString *const IMAGE_BASE_URL;
-(void) getPopularMoviesList:(void (^)(NSArray<Movie *> *movieList))onMovieList;

@end
