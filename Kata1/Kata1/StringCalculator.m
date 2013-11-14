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

-(id)init{
    if (!self) {
        self = [super init];
    }
    if (self) {
        listNumber = [[NSMutableArray alloc] init];
    }
    
    return self;
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

    if (![self parseString:secondNum]||![self parseString:firstNum]) {
        return 0;
    }
    
    //start test
    for (NSString *str in listNumber) {
        NSLog(@"value = %@",str);
    }
    return 0;
    //end test
    
    for (NSString *currentString in listNumber) {
        if (![currentString isNumber]) {
            return 0 ;
        }else{
            result += currentString.integerValue;
        }
    }
    
    return result;
}

-(BOOL)parseString:(NSString*)string{
    NSLog(@"parse %@",string);
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:
                                  @"\n" options: 0 error:nil];
    NSArray *results = [regex matchesInString:string
                                      options:0
                                        range:NSMakeRange(0, [string length])];
    
    NSRange range1,range2;
    range1 = NSMakeRange(0, 0);
    for (int i=0;i<=[results count];i++)
    {
        if (i<[results count]) {
            range2 = ((NSTextCheckingResult *)[results objectAtIndex:i]).range;
        }else{
            range2 = NSMakeRange(string.length, 0);
        }
        
        NSInteger length = range2.location-range1.location;
        NSLog(@"get at %d %d",range1.location+range1.length,range2.location-range1.location);
        if (length) {
            [listNumber addObject:[string substringWithRange:NSMakeRange(range1.location+range1.length, range2.location-range1.location)]];
        }
        
        range1 = range2;
    }
    return YES;
}
@end
