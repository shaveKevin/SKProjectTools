
//
//  Created by shaveKevin on 15/4/21.
//  Copyright (c) 2015年 shavekevin. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  轮播图  下面有使用方法
 */

typedef NS_ENUM(NSInteger, ICPageControlPosition) {
    ICPageControlPosition_TopLeft,
    ICPageControlPosition_TopCenter,
    ICPageControlPosition_TopRight,
    ICPageControlPosition_BottomLeft,
    ICPageControlPosition_BottomCenter,
    ICPageControlPosition_BottomRight
};

@protocol SKBannerViewDelegate;

@interface SKBannerView : UIView
@property (nonatomic, assign) id<SKBannerViewDelegate> skBannerViewDelegate;
@property (nonatomic, assign) BOOL autoScroll;  // default is YES, set NO to turn off autoScroll
@property (nonatomic, assign) NSUInteger scrollInterval;    // scroll interval, unit: second, default is 2 seconds
@property (nonatomic, assign) ICPageControlPosition pageControlPosition;    // pageControl position, defautl is bottomright
@property (nonatomic, assign) BOOL hidePageControl; // hide pageControl, default is NO


- (void)initWithImageURLs:(NSArray *)imageURLs placeholder:(UIImage *)placeholder delegate:(id<SKBannerViewDelegate>)delegate DEPRECATED_ATTRIBUTE;


- (void)initWithImageURLs:(NSArray *)imageURLs placeholder:(UIImage *)placeholder delegate:(id<SKBannerViewDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets DEPRECATED_ATTRIBUTE;


- (void)initWithCount:(NSInteger)count delegate:(id<SKBannerViewDelegate>)delegate;

- (void)initWithCount:(NSInteger)count delegate:(id<SKBannerViewDelegate>)delegate edgeInsets:(UIEdgeInsets)edgeInsets;
@end

@protocol SKBannerViewDelegate <NSObject>

@required

- (void)imagePlayerView:(SKBannerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index;

@optional

- (void)imagePlayerView:(SKBannerView *)imagePlayerView didTapAtIndex:(NSInteger)index imageURL:(NSURL *)imageURL DEPRECATED_ATTRIBUTE;


- (void)imagePlayerView:(SKBannerView *)imagePlayerView didTapAtIndex:(NSInteger)index;




/**
 *  使用方法：
 */
/*
- (void)createFirstView {
    SKBannerView *bannerView  = [[SKBannerView alloc]initWithFrame:CGRectMake(0,  0, kScreenWidth, 140)];
    self.imageArray = @[[NSURL URLWithString:@"http://www.ghzw.cn/wzsq/UploadFiles_9194/201109/20110915154150869.bmp"],
                        [NSURL URLWithString:@"http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1501/08/c0/1604174_1420647050891_800x600.jpg"],
                        [NSURL URLWithString:@"http://www.yancheng.gov.cn/ztzl/zgycddhsdgy/xwdt/201109/W020110902584601289616.jpg"],
                        [NSURL URLWithString:@"http://d.hiphotos.baidu.com/image/pic/item/caef76094b36acaf0511eabd7ed98d1000e99cf9.jpg"]];
    
    [bannerView initWithCount:self.imageArray.count delegate:self];
    bannerView.scrollInterval = 2.0f;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [[self view]addSubview:bannerView];
}
 
//代理方法
- (void)imagePlayerView:(SKBannerView *)imagePlayerView loadImageForImageView:(UIImageView *)imageView index:(NSInteger)index {
 // recommend to use SDWebImage lib to load web image
 //    [imageView setImageWithURL:[self.imageURLs objectAtIndex:index] placeholderImage:nil];
 
 imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[self.imageArray objectAtIndex:index]]];
 }
 //跳转
 - (void)imagePlayerView:(SKBannerView *)imagePlayerView didTapAtIndex:(NSInteger)index {
 //点击跳转
 NSLog(@"did tap index = %d", (int)index);
 
 }

 */
@end
