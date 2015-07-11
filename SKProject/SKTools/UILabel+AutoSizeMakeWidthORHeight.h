//
//  UILabel+AutoSizeMakeWidthORHeight.h
//  UIlabel
//
//  Created by shaveKevin on 15/7/11.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//
/**
 *  目的实现label 宽和高的自适应
 *
 *  @param AutoSizeMakeWidthORHeight 第一个方法目的是实现宽度自适应
 *
 *  @return 第二个方法是实现高度自适应  用法是 引入头文件,直接调方法
 */
#import <UIKit/UIKit.h>
///
@interface UILabel (AutoSizeMakeWidthORHeight)
- (void)setTitleWidth:(NSString *)title Font:(UIFont *)font BackgroundColor :(UIColor *)bacColor TitleColor :(UIColor *)titleColor;


- (void)setTitleHeight:(NSString *)title Font:(UIFont *)font BackgroundColor :(UIColor *)bacColor TitleColor :(UIColor *)titleColor;
@end
