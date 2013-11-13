//
//  StringCalculator.m
//  Kata1
//
//  Created by Hoang Manh Truong on 11/13/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//
/*
K1-1.4 red
*/
#import "StringCalculator.h"

@implementation StringCalculator

-(NSNumberFormatter*)formatter{
    if (!formatter) {
        formatter = [[NSNumberFormatter alloc] init];
    }
    return formatter;
}

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

    if (![self isNumberOfString:firstNum]||![self isNumberOfString:secondNum]) {
        NSLog(@"Input error");
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TDD Add function"
                                                        message:@"input error"
                                                       delegate:Nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
        return 0;
    }
    
    result = firstNum.integerValue+secondNum.integerValue;
    
    return result;
}

-(BOOL)isNumberOfString:(NSString*)string{
    NSNumber *number = [self.formatter numberFromString:string];
    return number?YES:NO;
}

@end
