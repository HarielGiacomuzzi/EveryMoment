//
//  NSObject+News.m
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/25/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import "News.h"
#import "readLater.h"

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
    if ([path isEqualToString:@"Nil"]) {
        news = [[NSMutableArray alloc] init];
        readLater *rl = [[readLater alloc] init];
        [rl load];
        _newsStored = rl.array;
        for (int i=0; i<_newsStored.count; i=i+2) {
            News *n = [[News alloc] init];
            n.title = _newsStored[i];
            n.desc = _newsStored[i+1];
            [news addObject:n];
        }
    }else{
        update = [[Update alloc] init];
        [update requestUpdateFrom:path];
        news = update.news;
    }
}

-(NSInteger) getCount{
    return [news count];
}

-(News *) objectAtIndex : (int)n{
    return news[n];
}

@end
