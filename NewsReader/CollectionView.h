//
//  CollectionView.h
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 3/4/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedManager.h"

@interface CollectionView : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property NSMutableArray *Feeds;

@end
