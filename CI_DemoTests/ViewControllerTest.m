//
//  ViewControllerTest.m
//  CI_Demo
//
//  Created by ChangChao-Tang on 2016/5/13.
//  Copyright © 2016年 ChangChao-Tang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ViewControllerTest : XCTestCase

@property (nonatomic)ViewController * vcToTest;

@end

@interface ViewController ()

-(NSString*)reverseString:(NSString*)originalString;
-(void)reverseString:(NSString*)originalString AsyncWithCompletion:(void(^)(NSString* resultString))completion;

@end

@implementation ViewControllerTest

- (void)setUp {
    [super setUp];
    self.vcToTest = [[ViewController alloc]init];
}

-(void)testReverseString{
    NSString * originalString = @"abcd";
    NSString * reversedString = [self.vcToTest reverseString:originalString];
    NSString * expectedString = @"dcba";
    XCTAssertTrue([reversedString isEqualToString:expectedString]);
}

-(void)testAsyncReverseString{
    NSString * original = @"abcd";
    NSString * expectedString = @"dcba";
    XCTestExpectation * resultCompletion = [self expectationWithDescription:@"reverse string async"];
    [self.vcToTest reverseString:original AsyncWithCompletion:^(NSString *resultString) {
        XCTAssertTrue([resultString isEqualToString:expectedString]);
        [resultCompletion fulfill];
    }];
    [self waitForExpectationsWithTimeout:5 handler:nil];
}

- (void)tearDown {
    [super tearDown];
}



@end
