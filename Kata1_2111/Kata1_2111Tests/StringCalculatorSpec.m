//
//  StringCalculatorSpec.m
//  Kata1_2111
//

#import "Kiwi.h"
#import "StringCalculator.h"

SPEC_BEGIN(StringCalculatorSpec)

__block  StringCalculator *str;
__block  NSString *input;

beforeAll(^{
    str = [[StringCalculator alloc] init];
});

afterAll(^{
    str = nil;
});
describe(@"StringCalculator test", ^{
        it(@"Test with empty string", ^{
            input = @"";
            
            NSInteger outPut = [str add: input];
            
            [[theValue(outPut) should] equal:theValue(0)];
        });
    
    it(@"Test with in put 1", ^{
        input = @"1";
        
        NSInteger outPut = [str add: input];
        
        [[theValue(outPut) should] equal:theValue(1)];
    });
    
    it(@"Test with input 1,1", ^{
        input = @"1,1";
        
        NSInteger outPut = [str add: input];
        
        [[theValue(outPut) should] equal:theValue(2)];
    });
    
    it(@"Test with input 221,112", ^{
        input = @"221,112" ;
        
        NSInteger outPut = [str add: input];
        
        [[theValue(outPut) should] equal:theValue(333)];
    });
    
    it(@"Test with input 1\n2,3", ^{
        input = @"1\n2,3" ;
        
        NSInteger outPut = [str add: input];
        
        [[theValue(outPut) should] equal:theValue(6)];
    });

});
SPEC_END
