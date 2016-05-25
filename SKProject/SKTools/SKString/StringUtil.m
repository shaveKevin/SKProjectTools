//
//  StringUtil.m
//  
//
//  Created by shaveKevin on unknown.
//  Copyright (c) 2012年 shaveKevin. All rights reserved.
//

#import "StringUtil.h"
#import <CoreText/CoreText.h>

@implementation NSString(Emoji)

+(BOOL)isContainEmoji:(NSString *)str {
    
    __block BOOL isEomji = NO;
    
    [str enumerateSubstringsInRange:NSMakeRange(0, [str length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     isEomji = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 isEomji = YES;
             }
         } else {
             // non surrogate
             if(0x278b <= hs && hs <= 0x2792) {
                 isEomji = NO;
             } else if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 isEomji = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
     }];
    
    return isEomji;
}

+ (NSString*)filterEmoji:(NSString*)str
{
    NSMutableString *retStr = [[NSMutableString alloc] init];
    [str enumerateSubstringsInRange:NSMakeRange(0, [str length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         BOOL isEomji = NO;
         const unichar hs = [substring characterAtIndex:0];
         
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     isEomji = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 isEomji = YES;
             }
         } else {
             // non surrogate
             if(0x278b <= hs && hs <= 0x2792) {
                 isEomji = NO;
             } else if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b) {
                 isEomji = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 isEomji = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 isEomji = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 isEomji = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50|| hs == 0x231a ) {
                 isEomji = YES;
             }
         }
         
         if(!isEomji){
             [retStr appendString:substring];
         }
         
     }];
    
    
    return retStr;
}

@end

@implementation StringUtil

+ (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];  
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];  
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];  
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];  
//    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData mutabilityOption:NSPropertyListImmutable format:NULL errorDescription:NULL];
    NSString *returnStr = [NSPropertyListSerialization propertyListWithData:tempData options:(NSPropertyListImmutable) format:NULL error:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];  
}

+ (NSString *)getReplacedStringForTransfer:(NSString *)original{
    NSString *dealed = original;
    dealed = [dealed stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
    dealed = [dealed stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    dealed = [dealed stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    dealed = [dealed stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    return dealed;
}

+ (NSString *)flattenHTML:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:nil] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        html = [html stringByReplacingOccurrencesOfString:[ NSString stringWithFormat:@"%@>", text] withString:@" "];
    }
    
    return html;
    
}

+ (NSAttributedString *)attributedStringFromMarkup:(NSString *)markup fontSize:(float)size{
    // (福建龙岩)2011年中考<font color='red'>真题</font>数学压轴题解析练习
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@""];
    NSString *nextTextChunk = nil;
    NSScanner *markupScanner = [NSScanner scannerWithString:markup];
    UIColor * fontColor = nil;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"Helvetica-Bold", size, nil);
    while (![markupScanner isAtEnd]) {
        // 如果出现<font color="red">aa</font><font color>...则scanUptoString intoString不会赋值（产生null值，但不是赋值）
        nextTextChunk = @"";
        [markupScanner scanUpToString:@"<" intoString:&nextTextChunk];
        [markupScanner scanString:@"<" intoString:NULL];
        if([nextTextChunk length] > 0) {
            NSDictionary *attrs;
            if (fontColor != nil) {
                attrs = [NSDictionary dictionaryWithObjectsAndKeys:(id)fontColor.CGColor,kCTForegroundColorAttributeName,(__bridge id)fontRef,kCTFontAttributeName,nil];
            } else {
                attrs = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)fontRef,kCTFontAttributeName,nil];
            }
            NSAttributedString *newPiece = [[NSAttributedString alloc] initWithString:nextTextChunk attributes:attrs];
            [attrString appendAttributedString:newPiece];
        }
        NSString *elementData = nil;
        [markupScanner scanUpToString:@">" intoString:&elementData];
        [markupScanner scanString:@">" intoString:nil];
        if (elementData) {
            if ([elementData length] > 3 && [[elementData substringToIndex:4] isEqual:@"font"]) {
                fontColor = [StringUtil fontColorFromString:elementData];
            } else if ([elementData length] > 4 && [[elementData substringToIndex:5] isEqual:@"/font"]){
                fontColor = nil;
            }
        }
    }
    return attrString;
}

+ (UIColor *)fontColorFromString:(NSString *)attrData{
    NSScanner *attrbuteDataScanner = [NSScanner scannerWithString:attrData];
    NSString *fontColor = nil;
    if ([attrbuteDataScanner scanUpToString:@"color=\"" intoString:nil]){
        [attrbuteDataScanner scanString:@"color=\"" intoString:nil];
        if([attrbuteDataScanner scanUpToString:@"\"" intoString:&fontColor]){
            if([fontColor isEqual:@"red"]){
                return [UIColor redColor];
            }
        }
        
    }
    attrbuteDataScanner = [NSScanner scannerWithString:attrData];
    if ([attrbuteDataScanner scanUpToString:@"color='" intoString:nil]){
        [attrbuteDataScanner scanString:@"color='" intoString:nil];
        if([attrbuteDataScanner scanUpToString:@"'" intoString:&fontColor]){
            if([fontColor isEqual:@"red"]){
                return [UIColor redColor];
            }
        }
        
    }
    return nil;
}

+ (NSString *)replaceChineseCharatorToEnglish:(NSString *)originalString{
    NSString *retString;
    retString = originalString;
    retString = [[retString stringByReplacingOccurrencesOfString:@"（" withString:@"("] stringByReplacingOccurrencesOfString:@"）" withString:@")"];
    retString = [[retString stringByReplacingOccurrencesOfString:@"【" withString:@"["] stringByReplacingOccurrencesOfString:@"】" withString:@"]"];
    return retString;
}

//判断是否为手机号码 目前按照android上的做法 判断第一位是不是1
+ (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString *mobileRegularExpression = @"^1\\d{10}";
    NSPredicate *regex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mobileRegularExpression];
    return [regex evaluateWithObject:mobileNum];
}

+ (NSString*)getStringSubSuffix:(NSString*)oldStr maxLength:(NSInteger)maxLength suffix:(NSString*)suffix position:(NSInteger)positon
{
    NSInteger subLength = 1;
    if (oldStr.length<=maxLength) {
        return oldStr;
    } else {
        NSMutableString *newStr = [[NSMutableString alloc] init];
        
        if(positon == XXTSuffixPositionLeft){
            [newStr appendString:suffix];
            [newStr appendString:[oldStr substringWithRange:NSMakeRange(oldStr.length-maxLength-subLength, maxLength-subLength)]];
        } else if (positon == XXTSuffixPositionCenter){
            [newStr appendString:[oldStr substringWithRange:NSMakeRange(0, (maxLength-subLength)/2)]];
            [newStr appendString:suffix];
            [newStr appendString:[oldStr substringWithRange:NSMakeRange(oldStr.length-(maxLength-(maxLength-subLength)/2)+subLength, maxLength-(maxLength-subLength)/2-subLength)]];
        } else {
            [newStr appendString:[oldStr substringWithRange:NSMakeRange(0, maxLength-subLength)]];
            [newStr appendString:suffix];
        }
        
        return newStr;
    }
    
}


+ (BOOL)isStr:(NSString*)str containSubStr:(NSString*)subStr;
{
    NSRange range = [str rangeOfString:subStr];
    if(range.location != NSNotFound){
        return YES;
    } else {
        return NO;
    }
}

+ (NSArray*)getLocationArrayOfSubStr:(NSString*)subStr inString:(NSString*)str
{
    NSArray *array=[str componentsSeparatedByString:subStr];
    NSMutableArray *arrayOfLocation=[[NSMutableArray alloc] init];
    int d=0;
    for (int i=0; i<array.count-1; i++) {
        NSString *string=[array objectAtIndex:i];
        NSNumber *number=[NSNumber numberWithInt:d+=string.length];
        d+=subStr.length;
        [arrayOfLocation addObject:number];
    }
    
    return arrayOfLocation;
}

+ (NSMutableAttributedString*)highlightSubStr:(NSString*)subStr inString:(NSString*)str useColor:(UIColor*)color
{
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    if(subStr.length>0){
        NSArray *locationArray = [StringUtil getLocationArrayOfSubStr:subStr inString:str];
        
        for (NSNumber *location in locationArray) {
            [attrStr addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange([location integerValue],subStr.length)];
        }
    }
    return attrStr;
}

+(BOOL)isContainEmoji:(NSString*)string
{
    return [NSString isContainEmoji:string];
}

+(NSString*)filterEmoji:(NSString*)str
{
    return [NSString filterEmoji:str];
}

+(BOOL)isAllMeaninglessChar:(NSString*)string
{
    BOOL flag = YES;
    
    NSString *tempString = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if(tempString!=nil&&tempString.length>0){
        flag = NO;
    }
    
    return flag;
}

+(BOOL)isEmptyString:(NSString *)string{
    if (string == nil) {
        return YES;
    }
    if ([string isEqual:[NSNull null]]) {
        return YES;
    }
    if (string.length <= 0) {
        return YES;
    }
    
    return NO;
}

+(NSString*)DataTOjsonString:(id)object
{
    if (object == nil) {
        return @"";
    }
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}
@end
