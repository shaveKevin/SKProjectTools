//
//  NoticeContentView.m
//  ha_ybt
//
//  Created by shaveKevin on 15/7/7.
//  Copyright (c) 2015年 hnzdkj. All rights reserved.
//

#import "NoticeContentView.h"
#import "UIColor+FromHex.h"
@implementation NoticeContentView




- (void)setImageView:(UIImage *)image WithTitle:(NSString *)title {
    
    _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 22, 22)];
    _iconImageView.image = image;
    [self addSubview:_iconImageView];
    
    _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, self.bounds.size.width - 30, 22)];
    _contentLabel.text = title;
    _contentLabel.textColor = [UIColor colorwithHexString:@"30D580" alpha:1.0f];
    _contentLabel.font = [UIFont fontWithName:@"STHeitiSC-Light" size:12];
    //自适应
    CGRect rect = [title boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 8000)
                                                   options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName: _contentLabel.font}
                                                   context:nil];
    CGSize labelsize = rect.size;
    [_contentLabel setFrame:CGRectMake(30,0,labelsize.width,22)];
    [self addSubview:_contentLabel];
    
}
@end
