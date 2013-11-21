//
//  StringCalculator.m
//  Kata1_1711
//
//  Created by Hoang Manh Truong on 11/18/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString*)str{
    NSMutableArray *numbs = [NSMutableArray array];
    NSInteger resuft = 0;
    
    if ([str hasPrefix:@"//"]) {
        NSString *delimiter = [self regexFromString:str];;

        if ([delimiter isEqualToString:@";"]) {
            str = [str substringWithRange:NSMakeRange(2, str.length-2)];
        }else{
            str = [str substringWithRange:NSMakeRange(delimiter.length+4, str.length-delimiter.length-4)];
        }
        NSLog(@"delimiter %@ str = %@",delimiter,str);
        
        NSArray *subStrings = [self sortString:str byDelimiter:delimiter];
        
        for (NSString *subString in subStrings) {
            [numbs addObjectsFromArray:[self getTextNoHaveDelimiterFromStr:subString]];
        }
    }else{
        [numbs addObjectsFromArray:[self getTextNoHaveDelimiterFromStr:str]];
    }
    
    for (NSString *num in numbs) {
        NSLog(@"one num = %@",num);
        
        if (num.integerValue<0) {
            return 0;
        }
        resuft += num.integerValue%1000;
    }
    
    return resuft;
}

-(NSString*)regexFromString:(NSString*)str{
    NSString *delimiter = @";";

//    if ([[str substringToIndex:3] isEqualToString:@"//["]) {
//        NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"\n" options:0 error:nil];
//        NSArray *objects = [regex matchesInString:str options:0 range:NSMakeRange(2, str.length-2)];
//        if ([objects count]>0) {
//            NSRange range = ((NSTextCheckingResult*)[objects objectAtIndex:0]).range;
//            if ([[str substringWithRange:NSMakeRange(range.location-1,1)] isEqualToString:@"]"]) {
//                delimiter = [str substringWithRange:NSMakeRange(3, range.location-4)];
//            }
//        }
//    }

    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:@"//[" options:0 error:nil];
    NSArray *objects = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    for (NSTextCheckingResult *oneResuft in objects) {
        NSRange range = oneResuft.range;
        NSLog(@"get delimiter %@",[str substringWithRange:range]);
    }
    return delimiter;
}

-(NSMutableArray*)getTextNoHaveDelimiterFromStr:(NSString*)str{
    NSMutableArray *result = [NSMutableArray array];
    
    NSRange range = [str rangeOfString:@","];
    
    if (range.length) {
        NSString *firstStr = [str substringWithRange:NSMakeRange(0,range.location)];
        NSString *secondStr = [str substringWithRange:NSMakeRange(range.location+1, str.length-range.length-range.location)];
        if (![firstStr isEqualToString:@"\n"]&&![secondStr isEqualToString:@"\n"]) {
            [result addObjectsFromArray:[self sortString:firstStr byDelimiter:@"\n"]];
            [result addObjectsFromArray:[self sortString:secondStr byDelimiter:@"\n"]];
        }
    }else{
        [result addObjectsFromArray:[self sortString:str byDelimiter:@"\n"]];
    }
    
    return result;
}

-(NSArray*)sortString:(NSString*)str byDelimiter:(NSString*)delimiter{
    NSMutableArray *resuft = [NSMutableArray array];
    
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:delimiter options:NSRegularExpressionIgnoreMetacharacters error:nil];
    NSArray *objects = [regex matchesInString:str options:0 range:NSMakeRange(0, str.length)];
    
    NSRange range1,range2;
    range1 =  NSMakeRange(0, 0);
    
    for (int i=0; i<=[objects count]; i++) {
        if (i<[objects count]) {
            range2 = ((NSTextCheckingResult*)[objects objectAtIndex:i]).range;
        }else{
            range2 = NSMakeRange(str.length, 0);
        }
        
        NSRange range = NSMakeRange(range1.location+range1.length, range2.location - (range1.location+range1.length));
        NSString *subString = [str substringWithRange:range];
        
        NSLog(@"delimiter %@ of String %@ range %d %d, subString %@",delimiter,str,range.location,range.length,subString);
        
        [resuft addObject:subString];

        range1 = range2;
    }
    
    return resuft;
}

@end
