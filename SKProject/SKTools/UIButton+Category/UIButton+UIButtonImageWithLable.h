//
//  UIButton+UIButtonImageWithLable.h
//  ybt
//
//  Created by shaveKevin on 15/7/9.
//  Copyright (c) 2015年 shaveKevin. All rights

#import <UIKit/UIKit.h>

@interface UIButton (UIButtonImageWithLable)
- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType;
- (void) setSKImage:(UIImage *)image withSKTitle:(NSString *)title forState:(UIControlState)stateType;
@end
