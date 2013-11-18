//
//  StringCalculator.m
//  Kata1_1511
//
//  Created by Hoang Manh Truong on 11/15/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSMutableArray*)listNum{
    if (!listNum) {
        listNum = [[NSMutableArray alloc] init];
    }
    
    return listNum;
}

-(NSInteger)add:(NSString*)input{
    NSInteger rel = 0;
    
    if (!input.length) {
        return 0;
    }
    
    NSRange range = [input rangeOfString:@","];
    
    NSString *firstNum,*secondNum;
    if (range.length) {
        firstNum = [input substringWithRange:NSMakeRange(0, range.location)];
        secondNum = [input substringWithRange:NSMakeRange(range.location+range.length,input.length - (range.location+range.length))];
    }else{
        firstNum = input;
    }
   
    
    if (![self sortNumberFromString:firstNum]||![self  sortNumberFromString:secondNum]) {
        NSLog(@"error number");
        return 0;
    }
    
    rel = firstNum.integerValue+secondNum.integerValue;
    
    return rel;
}

-(BOOL)sortNumberFromString:(NSString*)str{
    NSLog(@"will check text %@",str);
    if ([str isEqualToString:@"\n"]) {
        return NO;
    }else if (!str){
        return YES;
    }

//    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@"k"];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\n" options:0 error:0];
    
    NSArray *listNewLine = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    
    NSRange range1 = NSMakeRange(0, 0);
    NSRange range2 = NSMakeRange(0, 0);
    
    for (NSInteger i = 0; i<=[listNewLine count];i++) {
        if (i<[listNewLine count]) {
            range2 = ((NSTextCheckingResult*)[listNewLine objectAtIndex:i]).range;
        }else{
            range2 = NSMakeRange(0,str.length);
        }
        
        NSRange rangeWillGet = NSMakeRange(range1.length+range1.location, (range2.length + range2.location) - (range1.location+range1.length));
        NSLog(@"range 2 = %d %d will get %d %d",range2.location,range2.length,rangeWillGet.location,rangeWillGet.length);
        
        NSString *oneNum = [str substringWithRange:rangeWillGet];
        NSLog(@"new string = %@",oneNum);
        if (![oneNum isNum]&&![oneNum isEqualToString:@"\n"]) {
            [[self listNum] addObject:oneNum];
        }
        
        range1 = range2;
    }
    return YES;
}
@end
