//
//  StringCalculator.h
//  Kata1_1511
//
//  Created by Hoang Manh Truong on 11/15/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+checkNum.h"

@interface StringCalculator : NSObject{
    NSMutableArray *listNum;
}

-(NSInteger)add:(NSString*)input;

@end
