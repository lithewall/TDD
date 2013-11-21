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
    
//    it(@"Test voi ky tu rong", ^{
//        input = @"";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(0)];
//    });
//    
//    it(@"Test voi mot so: 1", ^{
//        input = @"1";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(1)];
//    });
//    
//    it(@"Test voi hai so: 12,3", ^{
//        input = @"12,3";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(15)];
//    });
//    
//    it(@"Test voi input loi: 121,212", ^{
//        input = @"121,212";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(333)];
//    });
//    
//    it(@"Test voi input co ky tu xuong dong: 1\n2,3", ^{
//        input = @"1\n2,3";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(6)];
//    });
//    
//    it(@"Test voi input co ky tu xuong dong bi loi: 1\n2,\n", ^{
//        input = @"1\n2,\n";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(0)];
//    });
//
//    it(@"Test voi input co delimiter: //;\n1;2", ^{
//        input = @"//;\n1;2";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(3)];
//    });
//    
//    it(@"Test voi input co so am: //;\n-1;-2", ^{
//        input = @"//;\n-1;-2";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(0)];
//    });
//    
//    it(@"Test voi input co so lon hon 1000: //;\n10002;1004", ^{
//        input = @"//;\n10002;1004";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(6)];
//    });
//    
//    it(@"Test voi input co delimiter dac biet: //[***]\n***10002***1004", ^{
//        input = @"//[***]\n***10002***1004";
//        
//        NSInteger outPut = [str add:input];
//        
//        [[theValue(outPut) should] equal:theValue(6)];
//    });
    
    it(@"Test voi input co nhieu delimiter dac biet: //[***][%][sss]\n***sss10%002***10sss04", ^{
        input = @"//[***][%][sss]\n***sss10%002***10sss04";
        
        NSInteger outPut = [str add:input];
        
        [[theValue(outPut) should] equal:theValue(6)];
    });
});
SPEC_END
