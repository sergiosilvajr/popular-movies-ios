//
//  ViewController.m
//  popular-movies-ios
//
//  Created by Luis Sergio da Silva Junior on 22/10/16.
//
//

#import "ViewController.h"
#import "HttpRequests.h"
#import "MovieTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end

@implementation ViewController

NSArray<Movie *> *movies;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HttpRequests *httpRequests = [[HttpRequests alloc] init];
                                  
   // [httpRequests doHttpRequest:];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MovieTableViewCell *movieTableViewCell = [tableView dequeueReusableCellWithIdentifier:@"moviecell" forIndexPath:indexPath];
    
    movieTableViewCell.movieTitleLabel.text = movies[indexPath.row].title;
    [movieTableViewCell.imageView sd_setImageWithURL:[NSURL URLWithString:@"https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg"]];
    return movieTableViewCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
