//
//  XViewController.m
//  XDecimalKit
//
//  Created by Leo on 08/31/2019.
//  Copyright (c) 2019 Leo. All rights reserved.
//

#import "XViewController.h"
#import "XDecimalKit-umbrella.h"

@interface XViewController ()

@end

@implementation XViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 测试数据
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; i++) {
        NSString *newNumStr = [NSString stringWithFormat:@"1.%02ld", i];
        [mArray addObject:newNumStr];
    }
    
    // 四舍五入
//    for (NSString *numStr in mArray) {
//        NSString *newNumStr = [XDecimalKit decimalAfterPoint:1 doubleValue:[numStr doubleValue]];
//        NSLog(@"===原始数据：%@，新数据：%@", numStr, newNumStr);
//    }
    
    // 截取
    for (NSString *numStr in mArray) {
        NSString *newNumStr = [XDecimalKit decimalOnePointAndRoundDownWithDoubleValue:[numStr doubleValue]];
        NSLog(@"===原始数据：%@，新数据：%@", numStr, newNumStr);
    }
    
    // 小数位后不补0
//    for (NSString *numStr in mArray) {
//        NSString *newNumStr = [XDecimalKit decimalAfterPoint:1 doubleValue:[numStr doubleValue] mode:XDRoundHalfEven type:XDZeroNull];
//        NSLog(@"===原始数据：%@，新数据：%@", numStr, newNumStr);
//    }
    
    // 运算
    NSString *value1 = @"2.22";
    NSString *value2 = @"1.11";
    
    NSString *result = [XDecimalKit decimalAdditionWithAddend:value1 augend:value2];
    NSLog(@"=== result : %@", result);
    
    result = [XDecimalKit decimalSubtractionWithSubtrahend:value1 minuend:value2];
    NSLog(@"=== result : %@", result);
    
    result = [XDecimalKit decimalMultiplicationWithMultiplier:value1 multiplicand:value2];
    NSLog(@"=== result : %@", result);
    
    result = [XDecimalKit decimalDivisionWithDivisor:value1 dividend:value2];
    NSLog(@"=== result : %@", result);
    
    result = [XDecimalKit decimalNumber:value1 raisingToPower:2];
    NSLog(@"=== result : %@", result);
    
    result = [XDecimalKit decimalNumber:result multiplyingByPowerOf10:1];
    NSLog(@"=== result : %@", result);
    
    result = [XDecimalKit decimalNumber:result roundMode:NSRoundDown afterPoint:1];
    NSLog(@"=== result : %@", result);
    
    NSComparisonResult cResult = [XDecimalKit decimalCompare:value1 compared:value2];
    NSLog(@"=== result : %ld", (long)cResult);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
