//
//  UILabel+AutoSizeMakeWidthORHeight.m
//  UIlabel
//
//  Created by shaveKevin on 15/7/11.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#define SKCGSizeMake [UIScreen mainScreen].bounds.size.width, 8000
#import "UILabel+AutoSizeMakeWidthORHeight.h"

@implementation UILabel (AutoSizeMakeWidth)
- (void)setTitleWidth:(NSString *)title Font:(UIFont *)font BackgroundColor :(UIColor *)bacColor TitleColor :(UIColor *)titleColor{
    self.text = title;
    self.font = font;
    self.textColor = titleColor;
    self.backgroundColor = bacColor;
    CGSize labelsize;
    float version = [self getSysBundle];
    if (version <= 6.0) {
        labelsize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(SKCGSizeMake) lineBreakMode:UILineBreakModeWordWrap];
    }
    else {
        CGRect rect = [self.text boundingRectWithSize:CGSizeMake(SKCGSizeMake)
                                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:  self.font}
                                              context:nil];
        labelsize = rect.size;
    }
    
    [self setFrame:CGRectMake(self.frame.origin.x,self.frame.origin.y, labelsize.width, self.frame.size.height)];

    
}



- (void)setTitleHeight:(NSString *)title Font:(UIFont *)font BackgroundColor :(UIColor *)bacColor TitleColor :(UIColor *)titleColor {
    
    self.text = title;
    self.font = font;
    self.textColor = titleColor;
    self.backgroundColor = bacColor;
    self.numberOfLines = 0;
    CGSize labelsize;
    float version = [self getSysBundle];
    //支持ios 6.0
    if (version <= 6.0) {
        labelsize = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(SKCGSizeMake) lineBreakMode:UILineBreakModeWordWrap];
    } else {
        //版本 7.0 + 可用
        CGRect rect = [self.text boundingRectWithSize:CGSizeMake(SKCGSizeMake)
                                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin
                                           attributes:@{NSFontAttributeName:  self.font}
                                              context:nil];
        labelsize = rect.size;
    }
    
    [self setFrame:CGRectMake(self.frame.origin.x,self.frame.origin.y, self.frame.size.width, labelsize.height)];
    [self sizeToFit];
    
}

- (CGFloat)getSysBundle {
   return [[[UIDevice currentDevice] systemVersion] floatValue];
}
@end
