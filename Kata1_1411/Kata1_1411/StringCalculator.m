//
//  StringCalculator.m
//  Kata1_1411
//
//  Created by Hoang Manh Truong on 11/14/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"
#import "NSString+CheckValue.h"

@implementation StringCalculator

-(NSInteger)add:(NSString*)input{
    NSInteger result = 0;
    
    if (!input.length) {
        return result;
    }
    
    NSRange range = [input rangeOfString:@","];
    
    NSString *firstText = [input substringWithRange:NSMakeRange(0, range.location+1)];
    NSString *secondText = [input substringWithRange:NSMakeRange(range.location,input.length-range.location-1)];
    
    if (![self parseString:firstText]||![self parseString:secondText]) {
        return 0;
    }
    
    for (NSString *input in listValue) {
        if ([input isNum]) {
            result +=input.integerValue;
        }
    }
    
    return result;
}

-(BOOL)parseString:(NSString*)subString{
    if ([subString isEqualToString:@"\n"]) {
        return NO;
    }
    
    [listValue addObject:subString];
    return YES;
}

-(NSMutableArray*)listValue{
    if (!listValue) {
        listValue = [[NSMutableArray alloc] init];
    }
    return listValue;
}

@end
