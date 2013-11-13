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
    if (input.length) {
        result = input.integerValue;
    }
    return result;
}

@end
