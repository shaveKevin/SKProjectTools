//
//  SKBorderView.h
//  DrawLine
//
//  Created by shaveKevin on 7/21/15.
//  Copyright (c) 2015 shaveKevin. All rights reserved.
//
/*
 这个类用于画虚线 使用哦须知 需要引入
 #import <QuartzCore/QuartzCore.h>
  和框架 QuartzCore.framework
 使用方法 ： 在写view的地方使用
  SKBorderView *contentView = [[SKBorderView alloc]initWithFrame:CGRectMake(100, 150, 100, 100)];
 contentView.backgroundColor = [UIColor orangeColor];
 contentView.borderType = BorderTypeDashed;
 contentView.dashPattern = 4;
 contentView.spacePattern = 4;
 contentView.borderWidth = 1;
 contentView.cornerRadius = 10;
 contentView.borderColor = [UIColor whiteColor];
 [self.view addSubview:contentView];
 */
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


typedef enum tagBorderType
{
    BorderTypeDashed,
    BorderTypeSolid
}BorderType;

@interface SKBorderView : UIView

@property (strong, nonatomic) CAShapeLayer *shapeLayer;
@property (assign, nonatomic) BorderType borderType;
@property (assign, nonatomic) CGFloat cornerRadius;
@property (assign, nonatomic) CGFloat borderWidth;
@property (assign, nonatomic) NSUInteger dashPattern;
@property (assign, nonatomic) NSUInteger spacePattern;
@property (strong, nonatomic) UIColor *borderColor;

@end
