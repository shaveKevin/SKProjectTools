//
//  NSDictionary+JSON.h
//
//
//  Created by shaveKevin on unknown.
//  Copyright (c) 2014年 shaveKevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSON)
- (id)JSONObjectForKey:(NSString *)aKey;
- (NSInteger)JSONIntegerObjectForKey:(NSString *)aKey;
@end
