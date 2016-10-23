//
//  MovieViewController.h
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 23/10/16.
//
//

#import "ViewController.h"
#import "Movie.h"

@interface MovieViewController : ViewController
@property (weak, nonatomic) IBOutlet UIImageView *moviePoster;
@property (weak, nonatomic) IBOutlet UILabel *movieDescription;
@property (nonatomic, nonnull) Movie *selectedMovie;
@end
