//
//  SKLabel.h
//  SKProject
//
//  Created by shaveKevin on 15/7/2.
//  Copyright (c) 2015年 shaveKevin. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  一个label 可以显示不同颜色和字体
 */
@interface SKLabel : UILabel {
    NSMutableAttributedString *resultAttributedString;
}
-(void)setKeyWordTextArray:(NSArray *)keyWordArray WithFont:(UIFont *)font AndColor:(UIColor *)keyWordColor;
-(void)setText:(NSString *)text WithFont:(UIFont *)font AndColor:(UIColor *)color;


/**
 *  用法举例：
 NSString *str = @"100000";
 NSString *str1 = [NSString stringWithFormat:@"总共:%@元",str];
 [_testLabel setText:str1 WithFont:[UIFont systemFontOfSize:15] AndColor:[UIColor blackColor]];
 [_testLabel setKeyWordTextArray:[NSArray arrayWithObjects:@"总共:",@"元", nil] WithFont:[UIFont systemFontOfSize:15] AndColor:[UIColor blueColor]];
 [_testLabel setKeyWordTextArray:[NSArray arrayWithObjects:str, nil] WithFont:[UIFont systemFontOfSize:15] AndColor:[UIColor redColor]];
 
 */
@end
