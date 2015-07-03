//
//  SKUserDefaults.h
//  Tools
//
//  Created by shaveKevin on 15/6/24.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  简单的写了一下NSUserDefaults 使用方便  下面是例子
 */
/*
 NSString *m = @"232132";
  [SKUserDefaults setValue:m forKey:@"ss"];
  NSLog(@"%@",[SKUserDefaults valueForKey:@"ss"]);
 */
@interface SKUserDefaults : NSObject
+(void)setValue:(id)value forKey:(NSString *)key;
+(id)valueForKey:(NSString *)key;
@end
