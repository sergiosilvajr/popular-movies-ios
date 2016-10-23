//
//  Movie.m
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import "Movie.h"
#import "HttpRequests.h"

@implementation Movie

-(NSString*)getMovieImageURL{
    return [NSString stringWithFormat:@"%@%@", IMAGE_BASE_URL, self.poster_path];
}
@end
