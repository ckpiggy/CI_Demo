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
    XCTAssertEqual(reversedString, expectedString);
}


- (void)tearDown {
    [super tearDown];
}



@end
