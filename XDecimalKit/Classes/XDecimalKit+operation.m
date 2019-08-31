//
//  XDecimalKit+operation.m
//  XDecimalKit
//
//  Created by Leo on 2019/8/29.
//  Copyright © 2019 Leo. All rights reserved.
//

#import "XDecimalKit+operation.h"

@implementation XDecimalKit (operation)

+ (NSString *)decimalAdditionWithAddend:(NSString *)addend augend:(NSString *)augend {
    return [self decimalAdditionWithAddend:addend augend:augend roundMode:NSRoundPlain afterPoint:NSNotFound];
}

+ (NSString *)decimalAdditionWithAddend:(NSString *)addend augend:(NSString *)augend roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point {
    if (![self validate:addend] || ![self validate:augend]) {
        return @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:addend];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:augend];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler defaultDecimalNumberHandler];
    if (point != NSNotFound) {
        handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:point raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    }
    NSDecimalNumber *result = [num1 decimalNumberByAdding:num2 withBehavior:handler];
    return [result description];
}

+ (NSString *)decimalSubtractionWithSubtrahend:(NSString *)subtrahend minuend:(NSString *)minuend {
    return [self decimalSubtractionWithSubtrahend:subtrahend minuend:minuend roundMode:NSRoundPlain afterPoint:NSNotFound];
}

+ (NSString *)decimalSubtractionWithSubtrahend:(NSString *)subtrahend minuend:(NSString *)minuend roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point {
    if (![self validate:subtrahend] || ![self validate:minuend]) {
        return @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:subtrahend];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:minuend];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler defaultDecimalNumberHandler];
    if (point != NSNotFound) {
        handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:point raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    }
    NSDecimalNumber *result = [num1 decimalNumberBySubtracting:num2 withBehavior:handler];
    return [result description];
}

+ (NSString *)decimalMultiplicationWithMultiplier:(NSString *)multiplier multiplicand:(NSString *)multiplicand {
    return [self decimalMultiplicationWithMultiplier:multiplier multiplicand:multiplicand roundMode:NSRoundPlain afterPoint:NSNotFound];
}

+ (NSString *)decimalMultiplicationWithMultiplier:(NSString *)multiplier multiplicand:(NSString *)multiplicand roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point {
    if (![self validate:multiplier] || ![self validate:multiplicand]) {
        return @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:multiplier];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:multiplicand];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler defaultDecimalNumberHandler];
    if (point != NSNotFound) {
        handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:point raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    }
    NSDecimalNumber *result = [num1 decimalNumberByMultiplyingBy:num2 withBehavior:handler];
    return [result description];
}

+ (NSString *)decimalDivisionWithDivisor:(NSString *)divisor dividend:(NSString *)dividend {
    return [self decimalDivisionWithDivisor:divisor dividend:dividend roundMode:NSRoundPlain afterPoint:NSNotFound];
}

+ (NSString *)decimalDivisionWithDivisor:(NSString *)divisor dividend:(NSString *)dividend roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point {
    if (![self validate:divisor] || ![self validate:dividend]) {
        return @"0";
    }
    if ([dividend doubleValue] == 0) {
        @throw [NSException exceptionWithName:@"XDeicimalException" reason:@"dividend value is 0" userInfo:nil];
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:divisor];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:dividend];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler defaultDecimalNumberHandler];
    if (point != NSNotFound) {
        handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:point raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    }
    NSDecimalNumber *result = [num1 decimalNumberByDividingBy:num2 withBehavior:handler];
    return [result description];
}

+ (NSString *)decimalNumber:(NSString *)number raisingToPower:(NSUInteger)power {
    return [self decimalNumber:number raisingToPower:power roundMode:NSRoundPlain afterPoint:NSNotFound];
}

+ (NSString *)decimalNumber:(NSString *)number raisingToPower:(NSUInteger)power roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point {
    if (![self validate:number]) {
        return @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler defaultDecimalNumberHandler];
    if (point != NSNotFound) {
        handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:point raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    }
    NSDecimalNumber *result = [num1 decimalNumberByRaisingToPower:power withBehavior:handler];
    return [result description];
}

+ (NSString *)decimalNumber:(NSString *)number multiplyingByPowerOf10:(short)power {
    if (![self validate:number]) {
        return @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number];
    NSDecimalNumber *result = [num1 decimalNumberByMultiplyingByPowerOf10:power];
    return [result description];
}

+ (NSString *)decimalNumber:(NSString *)number multiplyingByPowerOf10:(short)power roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point {
    if (![self validate:number]) {
        return @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler defaultDecimalNumberHandler];
    if (point != NSNotFound) {
        handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:point raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    }
    NSDecimalNumber *result = [num1 decimalNumberByMultiplyingByPowerOf10:power withBehavior:handler];
    return [result description];
}

+ (NSString *)decimalNumber:(NSString *)number roundMode:(NSRoundingMode)mode afterPoint:(NSUInteger)point {
    if (![self validate:number]) {
        number = @"0";
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:number];
    NSDecimalNumberHandler *handler = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:mode scale:point raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *result = [num1 decimalNumberByRoundingAccordingToBehavior:handler];
    return  [result description];
}

+ (NSComparisonResult)decimalCompare:(NSString *)value1 compared:(NSString *)value2 {
    if (![self validate:value1] || ![self validate:value2]) {
        @throw [NSException exceptionWithName:@"XDeicimalException" reason:@"compare value is null" userInfo:nil];
    }
    NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:value1];
    NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:value2];
    return [num1 compare:num2];
}

@end
