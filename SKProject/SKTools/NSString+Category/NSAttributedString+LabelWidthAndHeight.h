//
//  NSAttributedString+LabelWidthAndHeight.h
//  SKProject
//
//  Created by shavekevin on 16/5/25.
//  Copyright © 2016年 shaveKevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 *  @brief 在这里总共有两个方法  （类目）
 *
 *  @param LabelWidthAndHeight 一个人是给出最大的宽来计算字符串的高度
 *  @parma  一个是根据字符串来计算出宽度
 *
 *  @return CGFloat
 */
@interface NSAttributedString (LabelWidthAndHeight)

/**
 *  Get the string's height with the fixed width.
 *
 *  @param width     Fixed width.
 *
 *  @return String's height.
 */
- (CGFloat)heightWithFixedWidth:(CGFloat)width;

/**
 *  Get the string's width.
 *
 *  @return String's width.
 */
- (CGFloat)width;

@end
