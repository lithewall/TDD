//
//  StringCalculator.m
//  Kata1_2111
//
//  Created by Hoang Manh Truong on 11/21/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import "StringCalculator.h"

@implementation StringCalculator

-(NSInteger)add:(NSString*)str{
    NSInteger resuft =0;
    NSMutableArray *listNum = [NSMutableArray array];
    
    
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
            [listNum addObjectsFromArray:[self getTextNoHaveDelimiterFromStr:subString]];
        }
    }else{
        [listNum addObjectsFromArray:[self getTextNoHaveDelimiterFromStr:str]];
    }

    for (NSString *oneNum in listNum) {
        resuft += oneNum.integerValue;
    }
    
    return resuft;
}

-(NSString*)regexFromString:(NSString*)str{
    return @";";
}

-(NSMutableArray*)getTextNoHaveDelimiterFromStr:(NSString*)str{
    NSMutableArray *result = [NSMutableArray array];
    
    NSRange range = [str rangeOfString:@","];
    
    if (range.length) {
        NSString *firstStr = [str substringWithRange:NSMakeRange(0,range.location)];
        NSString *secondStr = [str substringWithRange:NSMakeRange(range.location+1, str.length-range.length-range.location)];
        
        NSArray *firstStrNum = [self sortString:firstStr byDelimiter:@"\n"];
        NSArray *secondStrNum = [self sortString:secondStr byDelimiter:@"\n"];
        
        [result addObjectsFromArray:firstStrNum];
        [result addObjectsFromArray:secondStrNum];
    }else{
        NSArray *strNum  = [self sortString:str byDelimiter:@"\n"];
        
        [result addObjectsFromArray:strNum];
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
