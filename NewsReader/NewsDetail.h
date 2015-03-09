//
//  NewsDetail.h
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/26/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"
@interface NewsDetail : UIViewController
{
    News* n;
    NSInteger countIndex;
}

@property NSString *titleNews;
@property NSString *desc;
@property News *feed;
@property NSInteger idx;
@property NSString *link;

-(void)PerformAction:(UISwipeGestureRecognizer *)sender;
-(void)rightNews;
-(void)leftNews;
@end

