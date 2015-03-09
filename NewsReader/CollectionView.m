//
//  CollectionView.m
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 3/4/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import "CollectionView.h"
#import "CollectionViewCellPersonalized.h"
#import "ViewController.h"

@interface CollectionView ()
@property (weak, nonatomic) IBOutlet UICollectionView *CollectionView;

@end

@implementation CollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
    FeedManager *f = [[FeedManager alloc] init];
    [f LoadDataSource];
    _Feeds = f.dataSources;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_Feeds count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCellPersonalized *c = (CollectionViewCellPersonalized *)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    FeedManager *f = (FeedManager *)_Feeds[indexPath.row];
    //NSURL *url = [NSURL URLWithString:f.link];
    c.CellImage.image = [UIImage imageNamed:@"CollectionViewBTN"];
    c.CellLogo.image = [UIImage imageNamed:f.logoName];
    c.CellTitle.text = f.feedName;
    
    return c;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"gotoFeedView"])
    {
        NSIndexPath *idx = [_CollectionView indexPathForCell:(CollectionViewCellPersonalized *)sender];
        
        FeedManager *f = _Feeds[idx.row];
        ViewController *feed = (ViewController *)segue.destinationViewController;
        feed.link = f.link;
        feed.logoIamge = f.logoName;
    }
}

@end
