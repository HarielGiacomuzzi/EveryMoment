//
//  NSObject+FeedManager.m
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 3/4/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import "FeedManager.h"

@implementation FeedManager

-(void)LoadDataSource{
        _dataSources = [[NSMutableArray alloc] init];
        FeedManager *f = [[FeedManager alloc] init];
        f.link = @"http://www.baixaki.com.br/rss/tecnologia.xml";
        f.logoName = @"tecmundo";
        f.feedName = @"Tecmundo";
        FeedManager *f2 = [[FeedManager alloc] init];
        f2.link = @"http://feeds.folha.uol.com.br/ciencia/rss091.xml";
        f2.logoName = @"folhadespaulosvg";
        f2.feedName = @"Folha de São Paulo";
        [_dataSources addObject:f];
        [_dataSources addObject:f2];
    
}

@end
