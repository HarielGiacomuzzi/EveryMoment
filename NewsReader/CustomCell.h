//
//  UITableViewCell+CustomCell.h
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/25/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncImageView.h"

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *feedTitle;
@property (weak, nonatomic) IBOutlet UITextView *feedDescription;
@property (weak, nonatomic) IBOutlet UIButton *feedRead;
@property (weak, nonatomic) IBOutlet AsyncImageView *feedImageView;

@end
