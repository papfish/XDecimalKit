//
//  XDecimalKit.m
//  XDecimalKit
//
//  Created by Leo on 2019/8/28.
//  Copyright © 2019 Leo. All rights reserved.
//

#import "XDecimalKit.h"

static XDRoundMode const defRoundMode = XDRoundHalfEven;
static XDZeroType const defZeroType = XDZeroDefault;

@implementation XDecimalKit

+ (NSString *)decimalAfterPoint:(NSUInteger)point doubleValue:(double)dValue mode:(XDRoundMode)mode type:(XDZeroType)type {
    if (mode == NSNotFound) {
        mode = defRoundMode;
    }
    if (type == NSNotFound) {
        type = defZeroType;
    }
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.minimumIntegerDigits = 1;
    numberFormatter.maximumFractionDigits = point;
    if (type == XDZeroDefault) {
        numberFormatter.minimumFractionDigits = point;
    }
    [numberFormatter setRoundingMode:(NSNumberFormatterRoundingMode)mode];
    return [numberFormatter stringFromNumber:@(dValue)];
}

+ (NSString *)decimalAfterPoint:(NSUInteger)point numberString:(NSString *)number mode:(XDRoundMode)mode type:(XDZeroType)type {
    return [self decimalAfterPoint:point doubleValue:[number doubleValue] mode:mode type:defZeroType];
}

+ (NSString *)decimalAfterPoint:(NSUInteger)point doubleValue:(double)dValue mode:(XDRoundMode)mode {
    return [self decimalAfterPoint:point doubleValue:dValue mode:mode type:defZeroType];
}

+ (NSString *)decimalAfterPoint:(NSUInteger)point numberString:(NSString *)number mode:(XDRoundMode)mode {
    return [self decimalAfterPoint:point doubleValue:[number doubleValue] mode:mode type:defZeroType];
}

+ (NSString *)decimalAfterPoint:(NSUInteger)point doubleValue:(double)dValue {
    return [self decimalAfterPoint:point doubleValue:dValue mode:defRoundMode type:defZeroType];
}

+ (NSString *)decimalAfterPoint:(NSUInteger)point numberString:(NSString *)number {
    return [self decimalAfterPoint:point doubleValue:[number doubleValue] mode:defRoundMode type:defZeroType];
}

+ (NSString *)decimalOnePointWithDoubleValue:(double)dValue {
    return [self decimalAfterPoint:1 doubleValue:dValue mode:defRoundMode type:defZeroType];
}

+ (NSString *)decimalOnePointWithNumberString:(NSString *)number {
    return [self decimalAfterPoint:1 doubleValue:[number doubleValue] mode:defRoundMode type:defZeroType];
}

+ (NSString *)decimalTwoPointWithDoubleValue:(double)dValue {
    return [self decimalAfterPoint:2 doubleValue:dValue mode:defRoundMode type:defZeroType];
}

+ (NSString *)decimalTwoPointWithNumberString:(NSString *)number {
    return [self decimalAfterPoint:2 doubleValue:[number doubleValue] mode:defRoundMode type:defZeroType];
}

+ (NSString *)decimalAfterPoint:(NSUInteger)point andRoundDownWithDoubleValue:(double)dValue {
    return [self decimalAfterPoint:point doubleValue:dValue mode:XDRoundDown type:defZeroType];
}

+ (NSString *)decimalAfterPoint:(NSUInteger)point andRoundDownWithNumberString:(NSString *)number {
    return [self decimalAfterPoint:point doubleValue:[number doubleValue] mode:XDRoundDown type:defZeroType];
}

+ (NSString *)decimalOnePointAndRoundDownWithDoubleValue:(double)dValue {
    return [self decimalAfterPoint:1 doubleValue:dValue mode:XDRoundDown type:defZeroType];
}

+ (NSString *)decimalOnePointAndRoundDownWithNumberString:(NSString *)number {
    return [self decimalAfterPoint:1 doubleValue:[number doubleValue] mode:XDRoundDown type:defZeroType];
}

+ (NSString *)decimalTwoPointAndRoundDownWithDoubleValue:(double)dValue {
    return [self decimalAfterPoint:2 doubleValue:dValue mode:XDRoundDown type:defZeroType];
}

+ (NSString *)decimalTwoPointAndRoundDownWithNumberString:(NSString *)number {
    return [self decimalAfterPoint:2 doubleValue:[number doubleValue] mode:XDRoundDown type:defZeroType];
}

+ (BOOL)validate:(NSString *)value {
    if (!value || ![value isKindOfClass:[NSString class]] || [@"" isEqualToString:value]) {
        return NO;
    }
    return YES;
}

@end
