//
//  Movie.h
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"

@interface Movie : JSONModel

@property (nonatomic) NSString *poster_path;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *overview;
@property (nonatomic) UIImage<Optional> *currentImage;
-(NSString*)getMovieImageURL;
@end
