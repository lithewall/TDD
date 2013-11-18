//
//  StringCalculator.m
//  Kata1_1711
//
//  Created by Hoang Manh Truong on 11/18/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"
#import "NSString+checkNum.h"

@implementation StringCalculator

-(NSInteger)add:(NSString*)str{
    NSInteger result;
    
    NSRange range = [str rangeOfString:@","];
    
    if (range.length == 0) {
        return str.integerValue;
    }
    
    NSString *firstStr = [str substringWithRange:NSMakeRange(0,range.location)];
    NSString *secondStr = [str substringWithRange:NSMakeRange(range.location+1, str.length-range.length-range.location)];
    
    
    
    result = firstStr.integerValue+secondStr.integerValue;
    
    return result;
}

@end
