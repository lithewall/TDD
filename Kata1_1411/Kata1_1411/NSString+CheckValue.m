//
//  NSString+CheckValue.m
//  Kata1_1411
//
//  Created by Hoang Manh Truong on 11/14/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "NSString+CheckValue.h"

static NSNumberFormatter *numbeFormater;

@implementation NSString (CheckValue)

+(NSNumberFormatter*)numberFormater{
    if (!numbeFormater) {
        numbeFormater = [[NSNumberFormatter alloc] init];
    }
    return numbeFormater;
}

-(BOOL)isNum{
    NSNumber *number = [[NSString numberFormater] numberFromString:self];
    return number?YES:NO;
}

@end
