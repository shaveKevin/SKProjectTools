//
//  StringUtil.h
//  
//
//  Created by shaveKevin on unknown.
//  Copyright (c) 2012年 shaveKevin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define XXTSuffixPositionLeft 0
#define XXTSuffixPositionCenter 1
#define XXTSuffixPositionRight 2

@interface StringUtil : NSObject

// 转换unicode编码为中文
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;

// objective-c 通过js 传递数据到html界面时 对于敏感字符进行转义
+ (NSString *)getReplacedStringForTransfer:(NSString *)original;

// 去除html中的标签内容
+ (NSString *)flattenHTML:(NSString *)html;

// 转换NSString 为 NSAttributedString
+ (NSAttributedString *)attributedStringFromMarkup:(NSString *)markup fontSize:(float)size;

// 替换中文标点符号为对应的英文字符
+ (NSString *)replaceChineseCharatorToEnglish:(NSString *)originalString;

//判断是否为手机号码 目前按照android上的做法 判断第一位是不是1
+ (BOOL)isMobileNumber:(NSString *)mobileNum;

+ (NSString*)getStringSubSuffix:(NSString*)oldStr maxLength:(NSInteger)maxLength suffix:(NSString*)suffix position:(NSInteger)positon;

//判断是否包含子字符串
+ (BOOL)isStr:(NSString*)str containSubStr:(NSString*)subStr;

//获取匹配字符串的所有起始位置
+ (NSArray*)getLocationArrayOfSubStr:(NSString*)subStr inString:(NSString*)str;

//高亮所有字符串
+ (NSMutableAttributedString *)highlightSubStr:(NSString*)subStr inString:(NSString*)str useColor:(UIColor *)color;

//字符串是否包含emoji
+(BOOL)isContainEmoji:(NSString*)string;

//字符串是否全为无意义字符(回车 空格)
+(BOOL)isAllMeaninglessChar:(NSString*)string;

+(NSString*)filterEmoji:(NSString*)str;

+(BOOL)isEmptyString:(NSString *)string;
+(NSString*)DataTOjsonString:(id)object;
@end
