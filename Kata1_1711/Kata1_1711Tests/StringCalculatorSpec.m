//
//  StringCalculatorSpec.m
//  Kata1_1711
//

#import "Kiwi.h"
#import "StringCalculator.h"

SPEC_BEGIN(StringCalculatorSpec)
__block NSString *input;
__block StringCalculator *str;
describe(@"StringCalculator test", ^{
    afterAll(^{
        str = nil;
            });
    
    beforeAll(^{
        str = [[StringCalculator alloc] init];
    });
    
    it(@"Test voi ky tu rong", ^{
        input = @"";
        
        NSInteger outPut = [str add:input];
        
        [[theValue(outPut) should] equal:theValue(0)];
    });
    
    it(@"Test voi mot so: 1", ^{
        input = @"1";
        
        NSInteger outPut = [str add:input];
        
        [[theValue(outPut) should] equal:theValue(1)];
    });
    
    it(@"Test voi hai so: 12,3", ^{
        input = @"12,3";
        
        NSInteger outPut = [str add:input];
        
        [[theValue(outPut) should] equal:theValue(15)];
    });
    
    it(@"Test voi input loi: 12as,3s", ^{
        input = @"12as,3s";
        
        NSInteger outPut = [str add:input];
        
        [[theValue(outPut) should] equal:theValue(0)];
    });
    
    it(@"Test voi input co ky tu xuong dong: 1\n2,3", ^{
        input = @"1\n2,3";
        
        NSInteger outPut = [str add:input];
        
        [[theValue(outPut) should] equal:theValue(6)];
    });
});
SPEC_END
