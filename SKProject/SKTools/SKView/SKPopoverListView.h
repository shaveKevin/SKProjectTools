//
//
#import <UIKit/UIKit.h>
@class SKPopoverListView;

@protocol SKPopoverListViewDataSource <NSObject>
@required

- (UITableViewCell *)popListView:(SKPopoverListView *)popListView
                    cellForIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)popListView:(SKPopoverListView *)popListView
       numberOfRowsInSection:(NSInteger)section;

@end

@protocol SKPopoverListViewDelegate <NSObject>
@optional

- (void)popListView:(SKPopoverListView *)popListView
     didSelectIndexPath:(NSIndexPath *)indexPath;

- (void)popListViewCancel:(SKPopoverListView *)popListView;

- (CGFloat)popListView:(SKPopoverListView *)popListView
   heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end


@interface SKPopoverListView : UIView <UITableViewDataSource, UITableViewDelegate>
{
   // UITableView *_listView;
    UILabel     *_titleView;
    UIControl   *_overlayView;
    
//    id<SKPopoverListViewDataSource> _datasource;
//    id<SKPopoverListViewDelegate>   _delegate;
    
}

@property (nonatomic, assign) id<SKPopoverListViewDataSource> datasource;
@property (nonatomic, assign) id<SKPopoverListViewDelegate>   delegate;

@property (nonatomic, retain) UITableView *listView;

- (void)setTitle:(NSString *)title;

- (void)show;
- (void)dismiss;

@property (nonatomic,assign) int allowDismissByTouch;//2--点击空白处不允许消失
@end
