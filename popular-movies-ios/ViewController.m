//
//  ViewController.m
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import "ViewController.h"
#import "MovieViewController.h"
#import "HttpRequests.h"
#import "MovieTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewController

NSArray<Movie *> *movies;
Movie *selectedMovie;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HttpRequests *httpRequests = [[HttpRequests alloc] init];
    [httpRequests getPopularMoviesList:^(NSArray<Movie *> *movieList){
        movies = movieList;
        [self.myTableView reloadData];
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (movies != nil){
        return movies.count;
    }	
    return 0;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier  isEqual: @"movieSegue"]){
        MovieViewController *movieViewController = segue.destinationViewController;
        Movie *currentMovie = movies[[self.myTableView indexPathForCell:sender].row];
        
        movieViewController.selectedMovie = currentMovie;
        movieViewController.moviePoster.image = currentMovie.currentImage;
        NSLog(@"prepareForSegue");
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell *movieTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"moviecell" forIndexPath:indexPath];
    Movie *currentMovie = movies[indexPath.row];
    
    NSURL *url = [NSURL URLWithString: [currentMovie getMovieImageURL]];
    
    movieTableViewCell.movieTitleLabel.text = currentMovie.title;
    [movieTableViewCell.imageView sd_setImageWithURL:url completed: ^(UIImage *image,NSError *error, SDImageCacheType cacheType,NSURL* url){
         [movieTableViewCell setNeedsLayout];
    }];
    
    currentMovie.currentImage = movieTableViewCell.imageView.image;
    return movieTableViewCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
