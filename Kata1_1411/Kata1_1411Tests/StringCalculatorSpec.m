//
//  StringCalculatorSpec.m
//  Kata1_1411
//

#import "Kiwi.h"
#import "StringCalculator.h"

SPEC_BEGIN(StringCalculatorSpec)

    __block NSString *input;
    __block StringCalculator *strCalculator;

describe(@"StringCalculator test", ^{

    beforeAll(^{
        strCalculator = [[StringCalculator alloc] init];
    });
    
    afterAll(^{
        strCalculator = nil;
    });

    
    it(@"Test input length 0",^{
        input = @"";
        
        NSInteger outPut = [strCalculator add:input];
        
        [[theValue(outPut) should] equal:theValue(0)];
    });
    
    it(@"Test input 12 ",^{
        input = @"12";
        
        NSInteger outPut = [strCalculator add:input];
        
        [[theValue(outPut) should] equal:theValue(12)];
    });
    
    it(@"Test input length 12,2",^{
        input = @"12,2";
        
        NSInteger outPut = [strCalculator add:input];
        
        [[theValue(outPut) should] equal:theValue(14)];
    });
    
});
SPEC_END
