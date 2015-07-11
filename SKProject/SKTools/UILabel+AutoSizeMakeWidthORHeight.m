//
//  UILabel+AutoSizeMakeWidthORHeight.m
//  UIlabel
//
//  Created by shaveKevin on 15/7/11.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import "UILabel+AutoSizeMakeWidthORHeight.h"

@implementation UILabel (AutoSizeMakeWidth)
- (void)setTitleWidth:(NSString *)title Font:(UIFont *)font BackgroundColor :(UIColor *)bacColor TitleColor :(UIColor *)titleColor{
    self.text = title;
    self.font = font;
    self.textColor = titleColor;
    self.backgroundColor = bacColor;
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 8000)
                                                  options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:  self.font}
                                                  context:nil];
    CGSize labelsize = rect.size;
    [self setFrame:CGRectMake(self.frame.origin.x,self.frame.origin.y, labelsize.width, self.frame.size.height)];

    
}



- (void)setTitleHeight:(NSString *)title Font:(UIFont *)font BackgroundColor :(UIColor *)bacColor TitleColor :(UIColor *)titleColor {
    
    self.text = title;
    self.font = font;
    self.textColor = titleColor;
    self.backgroundColor = bacColor;
    self.numberOfLines = 0;
    CGRect rect = [self.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 8000)
                                          options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:  self.font}
                                          context:nil];
    CGSize labelsize = rect.size;
    [self setFrame:CGRectMake(self.frame.origin.x,self.frame.origin.y, self.frame.size.width, labelsize.height)];
    //sizeToFit 这个方法一定要写上,否则会出问题的。
    [self sizeToFit];
    
}
@end
