//
//  XDecimalKit.h
//  XDecimalKit
//
//  Created by Leo on 2019/8/28.
//  Copyright © 2019 Leo. All rights reserved.
//

#import <Foundation/Foundation.h>

// 舍入规则，定义与NSNumberFormatterRoundingMode一致
typedef enum : NSInteger {
    // 向正方向舍入的舍入模式，1.3 => 2，1.7 => 2，-1.7 => 1
    XDRoundCeiling = 0,
    // 向负方向舍入的舍入模式，1.3 => 1，1.7 => 1，-1.7 => -2
    XDRoundFloor = 1,
    // 不对舍弃部分前面的数字加1，相当于截取. 1.3 => 1，1.7 => 1，-1.7 => -1
    XDRoundDown = 2,
    // 对非零舍弃部分前面的数字加1，1.3 => 2，1.7 => 2，-1.7 => -2
    XDRoundUp = 3,
    // 向最接近数字方向舍入的舍入模式，如果与两个相邻数字的距离相等，则向相邻的偶数舍入。1.5 => 2，2.5 => 2
    // 此舍入模式可以在统计上将累加错误减到最小，也称为“银行家舍入法”
    XDRoundHalfEven = 4,    // 默认
    // 向最接近数字方向舍入的舍入模式，1.5 => 1
    XDRoundHalfDown = 5,
    // 向最接近数字方向舍入的舍入模式，1.5 => 2
    XDRoundHalfUp = 6,
} XDRoundMode;

// 小数位后不足默认补0
typedef enum : NSInteger {
    // 补充0
    XDZeroDefault = 0,      // 默认
    // 去掉0
    XDZeroNull = 1,
} XDZeroType;

NS_ASSUME_NONNULL_BEGIN

@interface XDecimalKit : NSObject

/**
 保留n位小数

 @param point 保留小数点位数
 @param dValue 双精度浮点数值
 @param mode 舍入模式
 @param type 小数位补齐类型
 @return 格式化后的数值字符串
 */
+ (NSString *)decimalAfterPoint:(NSUInteger)point doubleValue:(double)dValue mode:(XDRoundMode)mode type:(XDZeroType)type;
// 支持传入字符串，更符合实际
+ (NSString *)decimalAfterPoint:(NSUInteger)point numberString:(NSString *)number mode:(XDRoundMode)mode type:(XDZeroType)type;

// 下面是精简方法，根据实际场景使用

+ (NSString *)decimalAfterPoint:(NSUInteger)point doubleValue:(double)dValue mode:(XDRoundMode)mode;
+ (NSString *)decimalAfterPoint:(NSUInteger)point numberString:(NSString *)number mode:(XDRoundMode)mode;
+ (NSString *)decimalAfterPoint:(NSUInteger)point doubleValue:(double)dValue;
+ (NSString *)decimalAfterPoint:(NSUInteger)point numberString:(NSString *)number;
+ (NSString *)decimalOnePointWithDoubleValue:(double)dValue;
+ (NSString *)decimalOnePointWithNumberString:(NSString *)number;
+ (NSString *)decimalTwoPointWithDoubleValue:(double)dValue;
+ (NSString *)decimalTwoPointWithNumberString:(NSString *)number;
// 小数位后截取
+ (NSString *)decimalAfterPoint:(NSUInteger)point andRoundDownWithDoubleValue:(double)dValue;
+ (NSString *)decimalAfterPoint:(NSUInteger)point andRoundDownWithNumberString:(NSString *)number;
+ (NSString *)decimalOnePointAndRoundDownWithDoubleValue:(double)dValue;
+ (NSString *)decimalOnePointAndRoundDownWithNumberString:(NSString *)number;
+ (NSString *)decimalTwoPointAndRoundDownWithDoubleValue:(double)dValue;
+ (NSString *)decimalTwoPointAndRoundDownWithNumberString:(NSString *)number;

+ (BOOL)validate:(NSString *)value;

@end

NS_ASSUME_NONNULL_END
