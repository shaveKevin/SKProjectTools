//
//  HTMLStringParser.m
//  shaveKevin
//
//  Created by shaveKevin on 14-9-4.
//  Copyright (c) 2014年 shaveKevin. All rights reserved.
//

#import "HTMLStringParser.h"

static HTMLStringParser *instance = nil;
@interface HTMLStringParser ()

- (NSString *)_getSubStringFromString:(NSString *)originalString WithstartTag:(NSString *)startString andEndedTag:(NSString *)endedString;

@end


@implementation HTMLStringParser

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[HTMLStringParser alloc] init];
    });
    return instance;
}


- (NSString *)parseWithOriginalHTMLString:(NSString *)orginalHTML
{
    NSString *localHTMLString = [NSString stringWithFormat:@"<html> \n"
                                 "<head> \n"
                                 "<style type=\"text/css\"> \n"
                                 "body {background-color: white;font-size:45px;}\n"
                                 "h3 {font-size: %f;font-style:plain;font-weight:bold;font-family: Arial, \"宋体\";background-color: rgb(255,255,255);padding:1px;}\n"
                                 "h3 {margin-top: 0.3cm;}\n"
                                 "</style> \n"
                                 "</head> \n"
                                 "<body>%@</body> \n"
                                 "</html>", 60.0f, orginalHTML];
  
    return localHTMLString;
}

- (NSString *)_getSubStringFromString:(NSString *)originalString WithstartTag:(NSString *)startString andEndedTag:(NSString *)endedString
{
    NSRange startedRange = [originalString rangeOfString:startString];
    NSRange endedRange = [originalString rangeOfString:endedString options:NSBackwardsSearch];
    NSRange newRange = NSMakeRange(startedRange.location, endedRange.location + endedRange.length - startedRange.location);
    NSString *subString = [originalString substringWithRange:newRange];
    subString = [subString stringByReplacingOccurrencesOfString:@"<p>&nbsp;</p>" withString:@""];
    subString = [subString stringByReplacingOccurrencesOfString:@"<p>&nbsp&nbsp&nbsp&nbsp<p>" withString:@""];
    return  subString;
}


@end
