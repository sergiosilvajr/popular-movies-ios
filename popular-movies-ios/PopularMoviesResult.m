//
//  PopularMoviesResult.m
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import "PopularMoviesResult.h"

@implementation PopularMoviesResult


-(NSArray<Movie *>*)getMovies{
    NSMutableArray<Movie *> *movies = [NSMutableArray array];
    for (id current in self.results){
        if (current != nil){
            Movie *movie = [[Movie alloc] initWithDictionary:current
            error: nil];
            [movies addObject:movie];
        }
    }
    return movies;
}
@end
