//
//  XDecimalKit+operation.h
//  XDecimalKit
//
//  Created by Leo on 2019/8/29.
//  Copyright © 2019 Leo. All rights reserved.
//

#import "XDecimalKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface XDecimalKit (operation)

// 默认四舍五入，全精度，忽略溢出、下溢和被零除时引发的异常，返回nil
// rounding mode: NSRoundPlain
// scale: No defined scale (full precision)
// ignore exactnessException (return nil)
// raise on overflow, underflow and divide by zero.

/**
 加法运算

 @param addend 加数
 @param augend 被加数
 @return 结果
 */
+ (NSString *)decimalAdditionWithAddend:(NSString *)addend augend:(NSString *)augend;
+ (NSString *)decimalAdditionWithAddend:(NSString *)addend augend:(NSString *)augend roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point;

/**
 减法运算
 
 @param subtrahend 减数
 @param minuend 被减数
 @return 结果
 */
+ (NSString *)decimalSubtractionWithSubtrahend:(NSString *)subtrahend minuend:(NSString *)minuend;
+ (NSString *)decimalSubtractionWithSubtrahend:(NSString *)subtrahend minuend:(NSString *)minuend roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point;

/**
 乘法运算
 
 @param multiplier 乘数
 @param multiplicand 被乘数
 @return 结果
 */
+ (NSString *)decimalMultiplicationWithMultiplier:(NSString *)multiplier multiplicand:(NSString *)multiplicand;
+ (NSString *)decimalMultiplicationWithMultiplier:(NSString *)multiplier multiplicand:(NSString *)multiplicand roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point;

/**
 除法运算
 
 @param divisor 除数
 @param dividend 被除数
 @return 结果
 */
+ (NSString *)decimalDivisionWithDivisor:(NSString *)divisor dividend:(NSString *)dividend;
+ (NSString *)decimalDivisionWithDivisor:(NSString *)divisor dividend:(NSString *)dividend roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point;

/**
 乘方运算
 
 @param number 底数
 @param power 指数
 @return 结果（幂）
 */
+ (NSString *)decimalNumber:(NSString *)number raisingToPower:(NSUInteger)power;
+ (NSString *)decimalNumber:(NSString *)number raisingToPower:(NSUInteger)power roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point;

/**
 底数 x 10的指数
 
 @param number 底数
 @param power 10的指数
 @return 结果
 */
+ (NSString *)decimalNumber:(NSString *)number multiplyingByPowerOf10:(short)power;
+ (NSString *)decimalNumber:(NSString *)number multiplyingByPowerOf10:(short)power roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point;

/**
 舍入方法

 @param number 数值
 @param mode 舍入规则
 @param point 保留小数位
 @return 结果
 */
+ (NSString *)decimalNumber:(NSString *)number roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point;

/**
 数值比较

 @param value1 第一个比较值
 @param value2 第二个比较值
 @return 返回第一个值相较于第二个值的结果
 */
+ (NSComparisonResult)decimalCompare:(NSString *)value1 compared:(NSString *)value2;

@end

NS_ASSUME_NONNULL_END
