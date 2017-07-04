//
//  GetHTMLTags.m
//  YHGetHTMLTags
//
//  Created by 今晚打老虎 on 2017/6/23.
//  Copyright © 2017年 今晚打老虎. All rights reserved.
//

#import "GetHTMLTags.h"

@implementation GetHTMLTags

+ (NSMutableArray *)GetMainTagIn:(NSString *)htmlString mainTag:(NSString *)tag
{
    NSMutableArray *array  = [NSMutableArray arrayWithArray:[htmlString componentsSeparatedByString:tag]];
    [array removeObject:array.firstObject];
    return array;
}
+ (NSMutableArray *)GetlittleTag:(NSMutableArray *)HTMLstringArray  littleTag:(NSArray<NSString *> *)tagArray smallTag:(NSString *)smallTag
{
    NSMutableArray *newArray = [NSMutableArray array];
    if (tagArray.count < 1) {
        return newArray;
    }

    for (int i = 0; i < HTMLstringArray.count; i ++) {
        NSString *littleString = (NSString *)HTMLstringArray[i];
        NSString * string = [NSString stringWithFormat:@"未找到相应标签%d",i];
        NSRange range = [littleString rangeOfString:tagArray.firstObject];
        if (range.length != 0) {
            string = [littleString substringFromIndex:range.location + range.length];
        }
        for (NSInteger j = 1; j < tagArray.count; j ++) {
            range = [string rangeOfString:tagArray[j]];
            if (range.length != 0) {
                string = [string substringFromIndex:range.location + range.length];
            }
        }
        
        range = [string rangeOfString:smallTag];
        if (range.length != 0) {
            string = [string substringToIndex:range.location];
        }
        if ([string isEqualToString:@""]) {
            string = [NSString stringWithFormat:@"未找到相应标签%d",i];
        }
        [newArray addObject: string];
    }
    return newArray;
}

@end
