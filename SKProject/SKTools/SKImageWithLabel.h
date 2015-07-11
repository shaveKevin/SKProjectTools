//
//  SKImageWithLabel
//  UILbelTimes
//
//  Created by shaveKevin on 15/7/9.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKImageWithLabel : UILabel
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *conentLabel;
- (void)setImageView:(UIImage *)image WithTitle:(NSString *)title;
@end
