//
//  NSString+Helper.m
//  Kata1
//
//  Created by Hoang Manh Truong on 11/13/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "NSString+Helper.h"

static NSNumberFormatter *formatter;

@implementation NSString (Helper)

+(NSNumberFormatter*)formatter{
    if (!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
    }
    return formatter;
}

-(BOOL)isNumber{
    NSNumber *number = [[NSString formatter] numberFromString:self];
    return number?YES:NO;
}

@end
