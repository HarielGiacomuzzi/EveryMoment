//
//  ViewController.m
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/25/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import "ViewController.h"
#import "NewsDetail.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property UISwipeGestureRecognizer *swipedCellRight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    feed = [[News alloc] init];
    [feed requestUpdateFrom:_link];
    
    
    _swipedCellRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cellWasSwiped:)];
    _swipedCellRight.numberOfTouchesRequired = 1;
    _swipedCellRight.direction =UISwipeGestureRecognizerDirectionLeft;
    [_tableView addGestureRecognizer:_swipedCellRight];
    
    
    //[feed requestUpdateFrom:@"http://www.baixaki.com.br/rss/tecnologia.xml"];
    //[feed requestUpdateFrom:@"http://feeds.folha.uol.com.br/ciencia/rss091.xml"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *c = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    n = [feed objectAtIndex:(int)indexPath.row];
    c.feedTitle.text = n.title;
    c.feedDescription.text = n.shortDesc;
    NSURL *url = [NSURL URLWithString:n.image];
    c.feedImageView.imageURL = url;
    if (n.userDidRead) {
        c.feedTitle.textColor = [UIColor grayColor];
        c.feedDescription.textColor = [UIColor grayColor];
    }else{
        c.feedTitle.textColor = [UIColor blackColor];
        c.feedDescription.textColor = [UIColor blackColor];
    }
    
    return c;
    
}

- (void) cellWasSwiped:(UISwipeGestureRecognizer *)gRecog{
    if (_swipedCellRight.state == UIGestureRecognizerStateEnded)
    {
        CGPoint swipeLocation = [gRecog locationInView:_tableView];
        NSIndexPath *swipedIndexPath = [_tableView indexPathForRowAtPoint:swipeLocation];
        //UITableViewCell *swipedCell = [_tableView cellForRowAtIndexPath:swipedIndexPath];
        [self performSegueWithIdentifier:@"gotoDetailsView" sender:swipedIndexPath];
    }
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [feed getCount];
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"gotoDetailsView"])
    {
        //NSIndexPath *idx = [_tableView indexPathForCell:(UITableViewCell *)sender];
        NSIndexPath *idx = (NSIndexPath *)sender;
        
        n = [feed objectAtIndex:(int)idx.row];
        NewsDetail *detail = (NewsDetail *)segue.destinationViewController;
        detail.titleNews = n.title;
        detail.desc = n.desc;
        detail.feed = feed;
        detail.idx = idx.row;
        
    }
}


@end
