//
//  NSString+checkNum.m
//  Kata1_1711
//
//  Created by Hoang Manh Truong on 11/18/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "NSString+checkNum.h"

static NSNumberFormatter *formatter;

@implementation NSString (checkNum)

+(NSNumberFormatter *)formatter{
    if (!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
    }
    return formatter;
}

-(BOOL)isNum{
    NSNumber *number = [formatter numberFromString:self];
    
    return number?YES:NO;
}

@end
