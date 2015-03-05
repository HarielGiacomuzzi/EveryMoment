//
//  NSObject+FeedManager.h
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 3/4/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedManager : NSObject

@property NSString *link;
@property NSString *logoName;
@property NSString *feedName;
@property NSMutableArray *dataSources;

-(void)LoadDataSource;

@end
