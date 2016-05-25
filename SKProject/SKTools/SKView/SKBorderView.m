//
//  SKBorderView.m
//  DrawLine
//
//  Created by shaveKevin on 7/21/15.
//  Copyright (c) 2015 shaveKevin. All rights reserved.
//

#import "SKBorderView.h"

@implementation SKBorderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)init
{
    self = [super init];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self initialize];
    }
    return self;
}


- (void)initialize
{
    [self drawDashedBorder];
}


#pragma mark - Drawing


- (void)drawDashedBorder
{
    if (_shapeLayer)
        //如果有移除
    [_shapeLayer removeFromSuperlayer];
    
    //-----------
    CGFloat cornerRadius = _cornerRadius;
    CGFloat borderWidth = _borderWidth;
    NSInteger dashPattern1 = _dashPattern;
    NSInteger dashPattern2 = _spacePattern;
    UIColor *lineColor = _borderColor ? _borderColor : [UIColor blackColor];
    //绘图开始
    CGRect frame = self.bounds;
    
    _shapeLayer = [CAShapeLayer layer];
    
    //创建可变的路径并设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    //设置起始点
    CGPathMoveToPoint(path, NULL, 0, frame.size.height - cornerRadius);
    //设置目标点
    CGPathAddLineToPoint(path, NULL, 0, cornerRadius);
    CGPathAddArc(path, NULL, cornerRadius, cornerRadius, cornerRadius, M_PI, -M_PI_2, NO);
    CGPathAddLineToPoint(path, NULL, frame.size.width - cornerRadius, 0);
    CGPathAddArc(path, NULL, frame.size.width - cornerRadius, cornerRadius, cornerRadius, -M_PI_2, 0, NO);
    CGPathAddLineToPoint(path, NULL, frame.size.width, frame.size.height - cornerRadius);
    CGPathAddArc(path, NULL, frame.size.width - cornerRadius, frame.size.height - cornerRadius, cornerRadius, 0, M_PI_2, NO);
    CGPathAddLineToPoint(path, NULL, cornerRadius, frame.size.height);
    CGPathAddArc(path, NULL, cornerRadius, frame.size.height - cornerRadius, cornerRadius, M_PI_2, M_PI, NO);
    
    //把shapeLayer 的路径设置成所画的路径
    _shapeLayer.path = path;
    //释放路径
    CGPathRelease(path);
    
    _shapeLayer.backgroundColor = [[UIColor clearColor] CGColor];
    _shapeLayer.frame = frame;
    _shapeLayer.masksToBounds = NO;
    [_shapeLayer setValue:[NSNumber numberWithBool:NO] forKey:@"isCircle"];
    _shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    _shapeLayer.strokeColor = [lineColor CGColor];
    _shapeLayer.lineWidth = borderWidth;
    _shapeLayer.lineDashPattern = _borderType == BorderTypeDashed ? [NSArray arrayWithObjects:[NSNumber numberWithInteger:dashPattern1], [NSNumber numberWithInteger:dashPattern2], nil] : nil;
    _shapeLayer.lineCap = kCALineCapRound;
    
    //把 shapeLayer 添加到view上
    [self.layer addSublayer:_shapeLayer];
    self.layer.cornerRadius = cornerRadius;
}


#pragma mark - 每次调用setter 方法都要画一次 -


- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self drawDashedBorder];
}


- (void)setBorderType:(BorderType)borderType
{
    _borderType = borderType;
    
    [self drawDashedBorder];
}


- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    
    [self drawDashedBorder];
}


- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    
    [self drawDashedBorder];
}


- (void)setDashPattern:(NSUInteger)dashPattern
{
    _dashPattern = dashPattern;
    
    [self drawDashedBorder];
}


- (void)setSpacePattern:(NSUInteger)spacePattern
{
    _spacePattern = spacePattern;
    
    [self drawDashedBorder];
}


- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    
    [self drawDashedBorder];
}


@end
