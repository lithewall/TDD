//
//  StringCalculatorSpec.m
//  Kata1
//

#import "Kiwi.h"
#import "StringCalculator.h"

SPEC_BEGIN(StringCalculatorSpec)
describe(@"StringCalculator test", ^{
    
    __block StringCalculator *sut;
    __block NSString *string;
    
    context(@"Tạo String calculator với một phương thức int add(string numbers)", ^{
        
        beforeAll(^{
            sut = [[StringCalculator alloc] init];
        });
        
        afterAll(^{
            sut = nil;
        });
        
//        it(@"phuong thuc add tra ve gia tri = 0 neu string truyen vao la rong", ^{
//            // given
//            string = @"";
//            
//            // when
//            NSInteger val =  [sut add:string];
//            
//            // then
//            [[theValue(val) should] equal:theValue(0)];
//        });
//        
//        it(@"test voi string truyen vao la 1 so co 1 chu so", ^{
//            // given
//            string = @"5";
//            
//            // when
//            NSInteger val =  [sut add:string];
//            
//            // then
//            [[theValue(val) should] equal:theValue(5)];
//        });
//        
//        it(@"test voi string truyen vao la 1 so co 2 chu so", ^{
//            // given
//            string = @"5,8";
//            	
//            // when
//            NSInteger val =  [sut add:string];
//            
//            // then
//            [[theValue(val) should] equal:theValue(13)];
//        });
//        
//        it(@"test voi string truyen vao khong la so", ^{
//            // given
//            string = @"5fs,as8";
//            
//            // when
//            NSInteger val =  [sut add:string];
//            
//            // then
//            [[theValue(val) should] equal:theValue(0)];
//        });
        
        it(@"test voi string truyen vao co chua ky tu xuong dong dang 1\n1,2 ", ^{
            // given
            string = @"1\n1\n\n\n\n\n,2\n";
            
            // when
            NSInteger val =  [sut add:string];
            
            // then
            [[theValue(val) should] equal:theValue(0)];
        });
        
//        it(@"test voi string truyen vao co chua ky tu xuong dong dang 1\n1,\n ", ^{
//            // given
//            string = @"1\n1\n\n\n\n\n,\n";
//            
//            // when
//            NSInteger val =  [sut add:string];
//            
//            // then
//            [[theValue(val) should] equal:theValue(0)];
//        });
    });
        
});
SPEC_END
