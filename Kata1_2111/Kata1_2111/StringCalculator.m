//
//  StringCalculator.m
//  Kata1_2111
//
//  Created by Hoang Manh Truong on 11/21/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString*)str{
    NSInteger resuft =0;
    NSMutableArray *listNum = [NSMutableArray array];
    
    listNum = [self getTextNoHaveDelimiterFromStr:str];
    
    for (NSString *oneNum in listNum) {
        resuft += oneNum.integerValue;
    }
    
    return resuft;
}

-(NSMutableArray*)getTextNoHaveDelimiterFromStr:(NSString*)str{
    NSMutableArray *result = [NSMutableArray array];
    
    NSRange range = [str rangeOfString:@","];
    
    if (range.length) {
        NSString *firstStr = [str substringWithRange:NSMakeRange(0,range.location)];
        NSString *secondStr = [str substringWithRange:NSMakeRange(range.location+1, str.length-range.length-range.location)];
        
        [result addObject:firstStr];
        [result addObject:secondStr];
    }else{
        [result addObject:str];
    }
    
    return result;
}

@end
