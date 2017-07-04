//
//  GetHTMLTags.h
//  YHGetHTMLTags
//
//  Created by 今晚打老虎 on 2017/6/23.
//  Copyright © 2017年 今晚打老虎. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetHTMLTags : NSObject

/**
 获取主要标签内的字符数组

 @param htmlString 主字符串
 @param tag 所需要获取的标签字符串
 @return 获取到的包含大致信息的字符串
 */
+ (NSMutableArray *)GetMainTagIn:(NSString *)htmlString mainTag:(NSString *)tag;

/**
 获取到精确的字符

 @param HTMLstringArray 主要标签内的字符数组
 @param tagArray HTML标签的前半部分辨标签数组
 @param smallTag HTML标签的后半部
 @return 返回获取到的精确的字符
 */
+ (NSMutableArray *)GetlittleTag:(NSMutableArray *)HTMLstringArray  littleTag:(NSArray<NSString *> *)tagArray smallTag:(NSString *)smallTag;
@end
