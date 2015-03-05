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
}


- (IBAction)ShareBtn:(id)sender {
    NSArray *itemsToShare = @[_titleNews , _link];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:itemsToShare applicationActivities:nil];
    activityVC.excludedActivityTypes = @[];
    [self presentViewController:activityVC animated:YES completion:nil];
}

@end
