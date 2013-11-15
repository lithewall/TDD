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
    
    it(@"Test with input 1", ^{
        input = @"1";
        
        NSInteger outPut = [val add:input];
        
        [[theValue(outPut) should] equal:theValue(1)];
    });
    
    it(@"Test with input 1,12", ^{
        input = @"1,12";
        
        NSInteger outPut = [val add:input];
        
        [[theValue(outPut) should] equal:theValue(13)];
    });
    
});
SPEC_END
