//
//  HTMLStringParser.h
//  shaveKevin
//
//  Created by shaveKevin on 14-9-4.
//  Copyright (c) 2014年 shaveKevin. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 
 *   使用方法
 NSString *htmlString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
 htmlString = [[HTMLStringParser sharedInstance] parseWithOriginalHTMLString:htmlString];
 [_webView loadHTMLString:htmlString baseURL:nil];
 */
@interface HTMLStringParser : NSObject

+ (id)sharedInstance;

- (NSString *)parseWithOriginalHTMLString:(NSString *)orginalHTML;

@end
