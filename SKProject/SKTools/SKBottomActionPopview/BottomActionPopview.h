//
//  BottomActionPopview.h
//  
//
//  Created by shavekevin on 15/10/26.
//
//
/**
 *  使用方法
 引入
 #import "BottomActionPopview.h"
 #import "BottomActionItem.h"
 触发方法
 - (void)pressAction:(id)sender {
 NSMutableArray *arrItems = [[NSMutableArray alloc] initWithCapacity:0];
 
 BottomActionItem *editItem = [[BottomActionItem alloc] init];
 [editItem setTitleColor:[UIColor redColor]];
 [editItem setTitleFont:[UIFont systemFontOfSize:15]];
 [editItem setStringTitle:@"编辑"];
 [arrItems addObject:editItem];
 
 BottomActionItem *rePublishItem = [[BottomActionItem alloc]init];
 [rePublishItem setTitleColor:[UIColor lightGrayColor]];
 [rePublishItem setTitleFont:[UIFont systemFontOfSize:15]];
 [rePublishItem setStringTitle:@"重新发送"];
 [arrItems addObject:rePublishItem];
 
 if(_popView)
 {
 _popView = nil;
 }
 if(!_popView) {
 _popView = [[BottomActionPopview alloc] initWithActions:arrItems topHint:nil];
 [_popView setFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
 }
 
 
 [_popView setDelegate:self];
 [_popView show];
 
 }
 #pragma mark - Popview delegate -
 - (void)bottomPopviewDidClicked:(NSInteger)index bottomActionPopview:(BottomActionPopview *)bottomActionPopview {
 NSLog(@"---点击了---%ld",(long)index);
 
 }
 
 */
#import <UIKit/UIKit.h>
@protocol BottomActionPopviewDelegate;

@interface BottomActionPopview : UIView

@property (nonatomic,weak) id<BottomActionPopviewDelegate> delegate;
@property (nonatomic,strong) id info;

- (instancetype)initWithActions:(NSArray *)arrayBottomActionTitles;

- (instancetype)initWithActions:(NSArray *)arrayBottomActionItems topHint:(NSString *)hint;

- (void)reloadPopView;

- (void)show;

@end


@protocol BottomActionPopviewDelegate <NSObject>

@optional

// 点击
- (void)bottomPopviewDidClicked:(NSInteger)index bottomActionPopview:(BottomActionPopview *)bottomActionPopview;

// 出现
- (void)bottomPopviewDidAppear;

// 消失
- (void)bottomPopviewDisAppear;


@end
