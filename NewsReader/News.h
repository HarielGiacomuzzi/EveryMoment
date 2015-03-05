//
//  NSObject+News.h
//  NewsReader
//
//  Created by Hariel Giacomuzzi on 2/25/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Update.h"

@interface News : NSObject
{
    NSMutableArray *news;
    Update *update;
}

@property NSInteger idNews;
@property NSString* dateNews;
@property NSString* title;
@property NSString* desc;
@property NSString *shortDesc;
@property NSString* link;
@property NSString *image;
@property BOOL userDidRead;

-(id)initWithTitle: (NSString *)title
       description: (NSString *)desc
           andDate: (NSString *)date;

-(void) requestUpdateFrom : (NSString *)path;
-(NSInteger) getCount;
-(News *) objectAtIndex : (int)n;

@end
