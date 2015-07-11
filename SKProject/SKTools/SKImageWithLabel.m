//
//  SKImageWithLabel.m
//  UILbelTimes
//
//  Created by shaveKevin on 15/7/9.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import "SKImageWithLabel.h"
#import "UIColor+FromHex.h"
@implementation SKImageWithLabel
- (void)setImageView:(UIImage *)image WithTitle:(NSString *)title {
     _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 3, self.bounds.size.height - 6 , self.bounds.size.height - 6)];
    _iconImageView.image = image;
    [self addSubview:_iconImageView];
    _conentLabel = [[UILabel alloc]initWithFrame:CGRectMake(_iconImageView.frame.size.width +15, 0, 30, 20)];
    [_conentLabel setNumberOfLines:0];
    _conentLabel.text = title;
    _conentLabel.textColor = [UIColor colorwithHexString:@"A1A1A1" alpha:1.0f];
    _conentLabel.font = [UIFont fontWithName:@"STHeitiSC-Light" size:11];
    CGRect rect = [_conentLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 8000)
                                                           options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:@{NSFontAttributeName:  _conentLabel.font}
                                                           context:nil];
    CGSize labelsize = rect.size;
    [_conentLabel setFrame:CGRectMake(_iconImageView.frame.size.width +10 +5,0, labelsize.width, self.bounds.size.height)];
    [self addSubview:_conentLabel];
    
}
@end
