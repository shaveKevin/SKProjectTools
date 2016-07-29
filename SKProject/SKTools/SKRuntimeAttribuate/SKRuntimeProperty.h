//
//  SKRuntimeProperty.h
//  SKProjectTools
//
//  Created by shavekevin on 16/7/29.
//  Copyright © 2016年 shaveKevin. All rights reserved.
//
/**
 *  @brief 获取属性和值
 *
 *  @param NSArray <#NSArray description#>
 *
 *  @return <#return value description#>
 */
#import <Foundation/Foundation.h>

@interface SKRuntimeProperty : NSObject
- (NSArray *)getAllIvar:(id)object;
- (NSArray *)getAllProperty:(id)object;
@end
