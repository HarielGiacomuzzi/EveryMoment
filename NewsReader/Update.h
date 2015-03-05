//
//  Update.h
//  ObjC-01
//
//  Created by Hariel Giacomuzzi on 2/19/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Update : NSObject <NSXMLParserDelegate>
{
    NSMutableArray *news;
    NSMutableString *title;
    NSString *element;
    NSMutableString *desc;
    NSMutableString *date;
    NSMutableString *fronPic;
    NSXMLParser *parser;
    NSMutableString *link;
    NSString *shortDesc;
    NSMutableString *image;
}

-(NSMutableArray *)requestUpdateFrom: (NSString *) path;
-(void)parseXMLFile:(NSString *)pathToFile;
-(NSString *)cutDescriptionToShort;

@end


