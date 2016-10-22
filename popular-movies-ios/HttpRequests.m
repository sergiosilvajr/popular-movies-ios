//
//  HttpRequests.m
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import "HttpRequests.h"
#import "Movie.h"
#import "PopularMoviesResult.h"
@implementation HttpRequests

static NSString *const BASE_URL = @"https://api.themoviedb.org/3";
static NSString *const API_KEY = @"&api_key=4895a1e4cec2aeb113fc7178193f3920";
static NSString *const GET_URL = @"/movie/";
//static NSString *const SEARCH_URL = @"/search/movie?query=";
//@"http://api.themoviedb.org/3/search/movie?query=Monsters+University&api_key=";
static NSString *const POPULAR_MOVIES_URL = @"https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=4895a1e4cec2aeb113fc7178193f3920";

-(void) doHttpRequest:(NSString *)url{
    AFHTTPSessionManager *manager= [AFHTTPSessionManager manager];
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:url parameters:nil progress:nil
     success:^(NSURLSessionTask *task, id responseObject){
         Movie *movie = [[Movie alloc] initWithDictionary:responseObject error:nil];
        NSLog(@"success %@",responseObject);
    }failure:^(NSURLSessionTask *task, NSError *error){
        NSLog(@"failure %ld", (long)[error code]);
    }]; 
}
-(void) getPopularMoviesList:(void (^)(NSArray<Movie *> *movieList))onMovieList;{
    AFHTTPSessionManager *manager= [AFHTTPSessionManager manager];

    [manager GET:POPULAR_MOVIES_URL parameters:nil progress:nil
         success:^(NSURLSessionTask *task, id responseObject){
             PopularMoviesResult *result = [[PopularMoviesResult alloc] initWithDictionary:responseObject error:nil];
             NSArray<Movie *> *movies = [result getMovies];
             onMovieList(movies);
             NSLog(@"success");
         }failure:^(NSURLSessionTask *task, NSError *error){
             NSLog(@"failure %ld", (long)[error code]);
         }];
}

//-(NSInteger *) getMovieIdByName:(NSString *)movieTitle{
//    NSString *movieQueryString = [NSString stringWithFormat: @"%@%@%@%@", BASE_URL,SEARCH_URL,movieTitle,API_KEY];
//    movieQueryString = [self replaceBlankStringByHttpCode:movieQueryString];
//    return 0;
// }

//-(NSString *) replaceBlankStringByHttpCode:(NSString *)inputString{
//    return [inputString stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
//}

//-(NSArray<Movie *>) getMovies:(NSString *)movieTitle,...{
//    return nil;
//}

@end
