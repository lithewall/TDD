//
//  NSString+checkNum.m
//  Kata1_1511
//
//  Created by Hoang Manh Truong on 11/15/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "NSString+checkNum.h"

static NSNumberFormatter *formatter;

@implementation NSString (checkNum)

+(NSNumberFormatter*)formatter{
    if (!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
    }
    
    return formatter;
}

-(BOOL)isNum{
    NSNumber *num = [[NSString formatter] numberFromString:self];
    return num?YES:NO;
}

@end
