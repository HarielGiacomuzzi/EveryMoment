//
//  NSObject+News.m
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/25/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import "News.h"

@implementation News

-(id)initWithTitle: (NSString *)title
       description: (NSString *)desc
           andDate: (NSString *)date{

    self = [super init];
    if(self){
        _dateNews = date;
        _desc = desc;
        _title = title;
        _userDidRead = NO;
    }
    return self;
}

-(void) requestUpdateFrom : (NSString *)path{
    update = [[Update alloc] init];
    [update requestUpdateFrom:path];
    news = update.news;
}

-(NSInteger) getCount{
    return [news count];
}

-(News *) objectAtIndex : (int)n{
    return news[n];
}

@end
