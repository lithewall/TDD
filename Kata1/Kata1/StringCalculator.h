//
//  StringCalculator.h
//  Kata1
//
//  Created by Hoang Manh Truong on 11/13/13.
//  Copyright (c) 2013 Hoang Manh Truong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Helper.h"

@interface StringCalculator : NSObject{
    NSMutableArray *listNumber;
}

- (NSInteger)add:(NSString *)input;

@end
