//
//  ViewController.h
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/25/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "News.h"

@interface ViewController : UIViewController <UITableViewDelegate , UITableViewDataSource, UIGestureRecognizerDelegate>
{
    News* feed;
    News *n;
}

@property NSString *link;

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (void)cellWasSwiped:(UIGestureRecognizer *)gRecog;

@end

