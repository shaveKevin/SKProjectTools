
/**
 *  一些宏定义和一些特殊的工具
 */
#import "SKObject.h"
#import "SKButton.h"
#import "SKLabel.h"
#import "SKUserDefaults.h"
#import "StringUtil.h"
#import "TimeUtil.h"
#import "SKUserDefaults.h"
#import "JSONStrToDict.h"
#import "NSDictionary+JSON.h"
#import "NSString+JSONCategories.h"
//Global frames
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kStatusBarHeight 20.0f
#define kNavigationBarHeight 44.0f
#define kNavigationBarLandscapeHeight 33.0f
#define kTabBarHeight 49.0f
#define kContentViewHeight (kScreenHeight - kStatusBarHeight - kNavigationBarHeight)
#define kMiddleContentViewHeight (kScreenHeight - kStatusBarHeight - kNavigationBarHeight - kTabBarHeight)
//--------------------------------------------------------------------------------------------------
//rgb颜色
#define RGB(__r, __g, __b) [UIColor colorWithRed:(__r / 255.0) green:(__g / 255.0) blue:(__b / 255.0) alpha:1]
#define RGBA(__r, __g, __b, __a) [UIColor colorWithRed:(__r / 255.0) green:(__g / 255.0) blue:(__b / 255.0) alpha:__a]
