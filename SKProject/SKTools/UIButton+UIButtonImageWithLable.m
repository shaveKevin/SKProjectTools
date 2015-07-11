//
//  UIButton+UIButtonImageWithLable.m
// 
//
//  Created by shaveKevin on 15/7/9.
//  Copyright (c) 2015年 shaveKevin. All rights

#import "UIButton+UIButtonImageWithLable.h"

@implementation UIButton (UIButtonImageWithLable)
- (void) setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)stateType {
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    UIFont *font = [UIFont systemFontOfSize:12];
    CGSize titleSize = [title sizeWithFont:font];
    [self.imageView setContentMode:UIViewContentModeCenter];
    [self setImageEdgeInsets:UIEdgeInsetsMake(-10.0,
                                              0.0,
                                              0.0,
                                              -titleSize.width)];
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:font];
    [self.titleLabel setTextColor:[UIColor blackColor]];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(40.0,
                                              -image.size.width,
                                              0.0,
                                              0.0)];
    [self setTitle:title forState:stateType];
}


- (void) setSKImage:(UIImage *)image withSKTitle:(NSString *)title forState:(UIControlState)stateType {
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize titleSize = [title sizeWithFont:font];
    [self.imageView setContentMode:UIViewContentModeCenter];
    //UIEdgeInsetsMake(CGFloat top, CGFloat left, CGFloat bottom, CGFloat right)
    [self setImageEdgeInsets:UIEdgeInsetsMake(10.0,
                                              10.0,
                                              10.0,
                                              titleSize.width - 70 )];
    [self setImage:image forState:stateType];
    
    [self.titleLabel setContentMode:UIViewContentModeCenter];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setFont:font];
    [self.titleLabel setTextColor:[UIColor blackColor]];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0,
                                              -image.size.width,
                                              0.0,
                                              -30.0)];
    [self setTitle:title forState:stateType];
}

@end
