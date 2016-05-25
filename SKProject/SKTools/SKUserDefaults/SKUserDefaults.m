//
//  SKUserDefaults.m
//  Tools
//
//  Created by shaveKevin on 15/6/24.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import "SKUserDefaults.h"

@implementation SKUserDefaults
+ (void)setValue:(id)value forKey:(NSString *)key{
    NSUserDefaults *skUserDefaults = [NSUserDefaults standardUserDefaults];
    [skUserDefaults setObject:value forKey:key];
    [skUserDefaults synchronize];
}
+ (id)valueForKey:(NSString *)key{
    NSUserDefaults *skUserDefaults = [NSUserDefaults standardUserDefaults];
   return [skUserDefaults objectForKey:key];
    
}
@end
