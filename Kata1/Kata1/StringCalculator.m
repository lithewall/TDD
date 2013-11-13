//
//  StringCalculator.m
//  Kata1
//
//  Created by Hoang Manh Truong on 11/13/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

- (NSInteger)add:(NSString *)input {
    NSInteger result = 0;
    NSRange bound = [input rangeOfString:@","];
    
    if (!input.length) {
        return 0;
    }else if (bound.length==0){
        return input.integerValue;
    }
    
    NSString *firstNum = [input substringWithRange:NSMakeRange(0, bound.location)];
    NSString *secondNum = [input substringWithRange:NSMakeRange(bound.location+bound.length,input.length-(bound.length+bound.location))];
    NSLog(@"first %@ second %@",firstNum,secondNum);
    result = firstNum.integerValue+secondNum.integerValue;
    
    return result;
}

@end
