//
//  NewsDetail.m
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/26/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import "NewsDetail.h"

@interface NewsDetail()
@property (weak, nonatomic) IBOutlet UITextView *NewsText;
@property (weak, nonatomic) IBOutlet UILabel *NewsTitle;


@end

@implementation NewsDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    _NewsText.text = _desc;
    _NewsTitle.text = _titleNews;
    countIndex = _idx;
 
    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PerformAction:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft ;
    [self.view addGestureRecognizer:left];
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(PerformAction:)];
    right.direction = UISwipeGestureRecognizerDirectionRight ;
    [self.view addGestureRecognizer:right];
}


- (IBAction)ShareBtn:(id)sender {
    NSArray *itemsToShare = @[_titleNews , _link];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    activityVC.excludedActivityTypes = @[];
    [self presentViewController:activityVC animated:YES completion:nil];
}
-(void)PerformAction:(UISwipeGestureRecognizer *)sender {
    if(sender.direction == UISwipeGestureRecognizerDirectionRight && countIndex > 0) {
        [self leftNews];
    }
    
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft && countIndex < _feed.getCount-1) {
        [self rightNews];
    }
}


-(void) rightNews
{
    n = [_feed objectAtIndex:(int)countIndex+1];
    _NewsText.text = n.desc;
    _NewsTitle.text = n.title;
    countIndex++;
}

-(void) leftNews
{
    n = [_feed objectAtIndex:(int)countIndex-1];
    _NewsText.text = n.desc;
    _NewsTitle.text = n.title;
    countIndex--;
}
- (IBAction)nextLeftNews:(id)sender {
    if(countIndex > 0)
        [self leftNews];
}
- (IBAction)nextRightNews:(id)sender {
    if(countIndex < _feed.getCount-1)
        [self rightNews];
}
@end
