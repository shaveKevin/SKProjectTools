//
//  BottomActionPopview.m
//  
//
//  Created by shavekevin on 15/10/26.
//
//

#define kActionHeight               44
#define kHintHeight                 44
#define kCancelBtnLMargon           10
#define kCancelBtnVMargon           8
#define kCancelBtnHeight            44
#define kCellLineHeight                 0.5                  //. cell分割线的高度
#define kCellLineColor          [UIColor colorWithRed:219/255. green:219/255. blue:219/255. alpha:1]    //. cell分割线颜色


#define kCancelBtnColor             [UIColor colorWithRed:134/255. green:140/255. blue:149/255. alpha:1]
#define kCancelBgColor              [UIColor colorWithRed:239/255. green:239/255. blue:244/255. alpha:1]

#import "BottomActionPopview.h"
#import "SKButton.h"
#import "BottomActionItem.h"

@interface BottomActionPopview()
@property (nonatomic,strong) NSArray *arrayBottomActionTitles;
@property (nonatomic,strong) NSArray *arrayBottomActionItems;
@property (nonatomic,copy) NSString *stringHint;
@property (nonatomic,strong) UIControl *bgControl;
@property (nonatomic,strong) UIView *actionTopView;
@property (nonatomic,strong) UIView *cancelView;

@end

@implementation BottomActionPopview

- (instancetype)initWithActions:(NSArray *)arrayBottomActionTitles
{
    if(self = [super init])
    {
        _arrayBottomActionTitles = arrayBottomActionTitles;
        
        [self relayoutSubviews];
    }
    return self;
}

- (instancetype)initWithActions:(NSArray *)arrayBottomActionItems topHint:(NSString *)hint;
{
    if(self = [super init])
    {
        _arrayBottomActionItems = arrayBottomActionItems;
        _stringHint = hint;
        [self relayoutSubviews];
    }
    return self;
}

- (void)reloadPopView
{
    
}

- (void)relayoutSubviews
{
    // bg
    if(!_bgControl)
    {
        _bgControl = [[UIControl alloc] init];
        [_bgControl setBackgroundColor:[UIColor blackColor]];
        [_bgControl addTarget:self action:@selector(bgDissMissView:) forControlEvents:UIControlEventTouchUpInside];
        [_bgControl setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    }
    if(!_bgControl.superview)
    {
        [self addSubview:_bgControl];
    }
    [_bgControl setAlpha:0];
    
    // top
    if(_actionTopView == nil)
    {
        _actionTopView = [[UIView alloc] init];
        [_actionTopView setBackgroundColor:[UIColor whiteColor]];
    }
    if(!_actionTopView.superview)
    {
        [self addSubview:_actionTopView];
    }
    
    CGRect frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0);
    [_actionTopView setFrame:frame];
    
    [self setupTopviewSubviews:_actionTopView];
}

- (void)setupTopviewSubviews:(UIView *)parentView
{
    CGFloat spaceXStart = 0;
    CGFloat spaceYStart = 0;
    
    if(_stringHint)
    {
        UILabel *labelHint = [[UILabel alloc] init];
        labelHint.backgroundColor = [UIColor whiteColor];
        [labelHint setTextAlignment:NSTextAlignmentCenter];
        [labelHint setFont:[UIFont systemFontOfSize:12]];
        [labelHint setTextColor:[UIColor redColor]];
        labelHint.text = _stringHint;
        [labelHint setFrame:CGRectMake(spaceXStart, spaceYStart, [UIScreen mainScreen].bounds.size.width, kHintHeight)];
        [parentView addSubview:labelHint];
        
        spaceYStart += kHintHeight;
        
        UILabel *lineLabel = [[UILabel alloc] init];
        [lineLabel setBackgroundColor:[UIColor orangeColor]];
        [parentView addSubview:lineLabel];
        [lineLabel setFrame:CGRectMake(spaceXStart, spaceYStart - kCellLineHeight, [UIScreen mainScreen].bounds.size.width, kCellLineHeight)];
    }
    
    if(_arrayBottomActionTitles.count)
    {
        for (int i = 0; i<_arrayBottomActionTitles.count; i++)
        {
            NSString *title = [_arrayBottomActionTitles objectAtIndex:i];
            SKButton *actionBtn = [SKButton buttonWithType:UIButtonTypeCustom];
            [actionBtn setInfo:[NSNumber numberWithInt:i]];
            [actionBtn setBackgroundColor:[UIColor whiteColor]];
            [actionBtn setTitle:title forState:UIControlStateNormal];
            actionBtn.titleLabel.font = [UIFont systemFontOfSize:15];
            [actionBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [actionBtn setFrame:CGRectMake(spaceXStart, spaceYStart, [UIScreen mainScreen].bounds.size.width, kActionHeight)];
            [actionBtn addTarget:self action:@selector(actionClicked:) forControlEvents:UIControlEventTouchUpInside];
            [parentView addSubview:actionBtn];
            
            spaceYStart += kActionHeight;
            
            // line
            if(i != _arrayBottomActionTitles.count - 1)
            {
                UILabel *lineLabel = [[UILabel alloc] init];
                [lineLabel setBackgroundColor:kCellLineColor];
                [parentView addSubview:lineLabel];
                [lineLabel setFrame:CGRectMake(spaceXStart, spaceYStart, [UIScreen mainScreen].bounds.size.width, kCellLineHeight)];
            }
        }
    }
    else if (_arrayBottomActionItems.count)
    {
        for (int i = 0; i<_arrayBottomActionItems.count; i++)
        {
            BottomActionItem *bottomActionItem = [_arrayBottomActionItems objectAtIndex:i];
            SKButton *actionBtn = [SKButton buttonWithType:UIButtonTypeCustom];
            [actionBtn setInfo:[NSNumber numberWithInt:i]];
            [actionBtn setBackgroundColor:[UIColor whiteColor]];
            [actionBtn setTitle:bottomActionItem.stringTitle forState:UIControlStateNormal];
            actionBtn.titleLabel.font = bottomActionItem.titleFont;
            [actionBtn setTitleColor:bottomActionItem.titleColor forState:UIControlStateNormal];
            [actionBtn setFrame:CGRectMake(spaceXStart, spaceYStart, [UIScreen mainScreen].bounds.size.width, kActionHeight)];
            [actionBtn addTarget:self action:@selector(actionClicked:) forControlEvents:UIControlEventTouchUpInside];
            [parentView addSubview:actionBtn];
            
            spaceYStart += kActionHeight;
            
            // line
            if(i != _arrayBottomActionItems.count - 1)
            {
                UILabel *lineLabel = [[UILabel alloc] init];
                [lineLabel setBackgroundColor:kCellLineColor];
                [parentView addSubview:lineLabel];
                [lineLabel setFrame:CGRectMake(spaceXStart, spaceYStart - kCellLineHeight, [UIScreen mainScreen].bounds.size.width, kCellLineHeight)];
            }
        }
    }
    
    // cancel
    if(_cancelView == nil)
    {
        _cancelView = [[UIView alloc] init];
        [_cancelView setBackgroundColor:kCancelBgColor];
    }
    if(_cancelView.superview == nil)
    {
        [parentView addSubview:_cancelView];
    }
    
    CGSize cancelViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 0);
    [_cancelView setFrame:CGRectMake(spaceXStart, spaceYStart, cancelViewSize.width, cancelViewSize.height)];
    [self setUpCancelView:_cancelView insize:&cancelViewSize];
    
    spaceYStart += cancelViewSize.height;
    
    if(parentView)
    {
        CGRect frame = parentView.frame;
        frame.size.height = spaceYStart;
        [parentView setFrame:frame];
    }
}

- (void)setUpCancelView:(UIView *)parentView insize:(CGSize *)inSize
{
    CGFloat spaceXStart = kCancelBtnLMargon;
    CGFloat spaceYStart = kCancelBtnVMargon;
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setFrame:CGRectMake(spaceXStart, spaceYStart, inSize->width - spaceXStart*2, kCancelBtnHeight)];
    [cancelBtn setBackgroundColor:kCancelBtnColor];
    [cancelBtn.layer setCornerRadius:3.0];
    [cancelBtn.layer setMasksToBounds:YES];
    cancelBtn.titleLabel.font =[UIFont systemFontOfSize:15];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [parentView addSubview:cancelBtn];
    
    spaceYStart += kCancelBtnHeight + kCancelBtnVMargon;
    
    // frame
    if(parentView != nil)
    {
        inSize -> height = spaceYStart;
        CGRect frame = parentView.frame;
        frame.size.height = inSize->height;
        [parentView setFrame:frame];
    }
}

- (void)actionClicked:(SKButton *)btn
{
    NSInteger index = [[btn info] integerValue];
    if([self delegate] && [[self delegate] respondsToSelector:@selector(bottomPopviewDidClicked:bottomActionPopview:)])
    {
        [[self delegate] bottomPopviewDidClicked:index bottomActionPopview:self];
    }
    [self dismiss];
}

- (void)bgDissMissView:(UIControl *)control
{
    [self dismiss];
}

- (void)cancel:(UIButton *)btn
{
    [self dismiss];
}

- (void)show
{
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    CGFloat topViewHeight = _actionTopView.frame.size.height;
    
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         __strong typeof(wself) sself = wself;
                         [sself.bgControl setAlpha:0.7];
                         [sself.actionTopView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - topViewHeight,
                                                                  [UIScreen mainScreen].bounds.size.width, topViewHeight)];
                     } completion:^(BOOL finished) {
                         __strong typeof(wself) sself = wself;
                         if([sself delegate] && [[sself delegate] respondsToSelector:@selector(bottomPopviewDidAppear)])
                         {
                             [[sself delegate] bottomPopviewDidAppear];
                         }
                         
                     }];
}

- (void)dismiss
{
    CGFloat topViewHeight = _actionTopView.frame.size.height;
    
    __weak typeof(self) wself = self;
    
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         
                         __strong typeof(wself) sself = wself;
                         
                         [sself.bgControl setAlpha:0];
                         [sself.actionTopView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height,
                                                                  [UIScreen mainScreen].bounds.size.width, topViewHeight)];
                     } completion:^(BOOL finished) {
                         
                         __strong typeof(wself) sself = wself;
                         
                         [sself removeFromSuperview];
                         
                         if([sself delegate] && [[sself delegate] respondsToSelector:@selector(bottomPopviewDisAppear)])
                         {
                             [[sself delegate] bottomPopviewDisAppear];
                         }
                        
                     }];
    
}




@end
