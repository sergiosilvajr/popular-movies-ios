//
//  MovieViewController.m
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 23/10/16.
//
//

#import "MovieViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NSURL *url = [NSURL URLWithString: [self.selectedMovie getMovieImageURL]];
    
    [self.moviePoster sd_setImageWithURL:url];
     self.movieDescription.text = self.selectedMovie.overview;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
