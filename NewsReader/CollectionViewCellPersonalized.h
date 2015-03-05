//
//  CollectionViewCellPersonalized.h
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 3/4/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface CollectionViewCellPersonalized : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *CellImage;
@property (weak, nonatomic) IBOutlet UIImageView *CellLogo;
@property (weak, nonatomic) IBOutlet UILabel *CellTitle;

@end
