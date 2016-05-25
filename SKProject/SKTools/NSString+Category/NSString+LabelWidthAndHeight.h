//
//  NSString+LabelWidthAndHeight.h
//  SKProject
//
//  Created by shavekevin on 16/5/25.
//  Copyright © 2016年 shaveKevin. All rights reserved.
//
/**
 *  @brief 在这里总共有三个方法  （类目）
 *
 *  @param LabelWidthAndHeight 一个人是给出最大的宽来计算字符串的高度
 *  @parma  一个是根据字符串来计算出宽度
 *  @parma  还有一个方法是计算一行字符串的高度
 *
 *  @return CGFloat
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (LabelWidthAndHeight)

/**
 *  Get the string's height with the fixed width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)heightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute fixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
- (CGFloat)widthWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

/**
 *  Get a line of text height.
 *
 *  @param attribute String's attribute, eg. attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:18.f]}
 *
 *  @return String's width.
 */
+ (CGFloat)aLineOfTextHeightWithStringAttribute:(NSDictionary <NSString *, id> *)attribute;

@end
