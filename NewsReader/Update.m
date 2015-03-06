//
//  Update.m
//  ObjC-01
//
//  Created by Hariel Giacomuzzi on 2/19/15.
//  Copyright (c) 2015 Hariel Giacomuzzi. All rights reserved.
//

#import "Update.h"
#import "News.h"
#import "NSString+HTML.h"

@implementation Update

-(void)requestUpdateFrom:(NSString*)path
{
    _news = [[NSMutableArray alloc] init];
    
    title = [@"" mutableCopy];
    date = [@"" mutableCopy];
    desc = [@"" mutableCopy];
    link = [@"" mutableCopy];
    image = [@"" mutableCopy];
    
    parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:path]];
    [self parseXMLFile];
    [_news removeObject:_news[0]];
}                                  
                                  
-(void)parseXMLFile {
    //NSURL *xmlPath = [NSURL URLWithString:pathToFile];
    parser.delegate = self;
    if([parser parse]){
        //NSLog(@"Success!");
    }else{
        //NSLog(@"Error");
    }
    
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
 namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName
   attributes:(NSDictionary *)attributeDict {
    element = elementName;
    if ([element isEqualToString:@"enclosure"]) {
        image = [attributeDict objectForKey:@"url"];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

    if([element isEqualToString:@"title"]){
        [title appendString:string];
    }else if ([element isEqualToString:@"description"]){
        [desc appendString:string];
    }else if ([element isEqualToString:@"pubDate"]){
        date = [string mutableCopy];
    }else if ([element isEqualToString:@"link"]){
        [link appendString:string];
    }
    return;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if(![title isEqualToString:@" "] && ![title isEqualToString:@""] && ![desc isEqualToString:@" "] && ![desc isEqualToString:@""]){
    
    desc = [[desc stringByConvertingHTMLToPlainText]mutableCopy];
    News *n = [[News alloc] initWithTitle:title description:desc andDate:date];
    n.link = link;
    n.shortDesc = [self cutDescriptionToShort];
    n.image = image;
    [_news addObject:n];
    title = [@"" mutableCopy];
    date = [@"" mutableCopy];
    desc = [@"" mutableCopy];
    link = [@"" mutableCopy];
    image = [@"" mutableCopy];
        
    }
    
    element = nil;

}

-(NSString *)cutDescriptionToShort{
    NSArray *a = [desc componentsSeparatedByString:@" "];
    NSMutableString *result;
    
    if([a count] > 18){
        result = [@"" mutableCopy];
        for (int i = 0; i < 18; i++) {
            [result appendString:a[i]];
            [result appendString:@" "];
        }
    }else{
        return desc;
    }
        
    return result;
}

@end