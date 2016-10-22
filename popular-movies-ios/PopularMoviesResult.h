//
//  PopularMoviesResult.h
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@interface PopularMoviesResult : JSONModel
@property (strong, nonatomic) NSArray<NSDictionary *> *results;
@property (nonatomic) NSNumber *total_pages;
@property (nonatomic) NSNumber *total_results;
@property (nonatomic) NSNumber *page;
-(NSArray<Movie *>*)getMovies;
@end
