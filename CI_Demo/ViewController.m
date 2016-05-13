//
//  ViewController.m
//  CI_Demo
//
//  Created by ChangChao-Tang on 2016/5/13.
//  Copyright © 2016年 ChangChao-Tang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)reverseString:(NSString*)originalString{
    NSString * result = @"";
    for (NSInteger i = originalString.length - 1; i >= 0; i --) {
        result = [result stringByAppendingString:[originalString substringWithRange:NSMakeRange(i, 1)]];
    }
    return result;
}

-(void)reverseString:(NSString*)originalString AsyncWithCompletion:(void(^)(NSString* resultString))completion{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString * res = [self reverseString:originalString];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(res);
        });
    });
}

@end
