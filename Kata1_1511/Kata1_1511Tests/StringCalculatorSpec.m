//
//  StringCalculatorSpec.m
//  Kata1_1511
//

#import "Kiwi.h"
#import "StringCalculator.h"

SPEC_BEGIN(StringCalculatorSpec)

    __block NSString *input;
    __block StringCalculator *val;

describe(@"StringCalculator test", ^{
    
    beforeAll(^{
        val = [[StringCalculator alloc] init];
    });
    
    afterAll(^{
        val = nil;
    });
    
     it(@"Test with input empty", ^{
         input = @"";
         
         NSInteger outPut = [val add:input];
         
         [[theValue(outPut) should] equal:theValue(0)];
     });
    
});
SPEC_END
