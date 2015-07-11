//
//  NoticeContentView.h
//  ha_ybt
//
//  Created by shaveKevin on 15/7/7.
//  Copyright (c) 2015年 hnzdkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticeContentView : UIView
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong)UILabel *contentLabel;
- (void)setImageView:(UIImage *)image WithTitle:(NSString *)title;
@end
