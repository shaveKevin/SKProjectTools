//
//  NSString+JSONCategories.m
//  
//
//  Created by shaveKevin on unknown.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import "NSString+JSONCategories.h"

@implementation NSString (JSONCategories)

-(id)JSONValue;
{
    NSData* data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}

@end
