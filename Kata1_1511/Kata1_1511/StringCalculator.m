//
//  StringCalculator.m
//  Kata1_1511
//
//  Created by Hoang Manh Truong on 11/15/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString*)input{
    NSInteger rel = 0;
    
    if (!input.length) {
        return 0;
    }
    
    NSRange range = [input rangeOfString:@","];
    
    NSString *firstNum = [input substringWithRange:NSMakeRange(0, range.location)];
    NSString *secondNum = [input substringWithRange:NSMakeRange(range.location+range.length,input.length - (range.location+range.length))];
    
    
    
    rel = firstNum.integerValue+secondNum.integerValue;
    
    return rel;
}

@end
