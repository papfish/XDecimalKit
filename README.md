# XDecimalKit

[![CI Status](https://img.shields.io/travis/papfish/XDecimalKit.svg?style=flat)](https://travis-ci.org/papfish/XDecimalKit)
[![Version](https://img.shields.io/cocoapods/v/XDecimalKit.svg?style=flat)](https://cocoapods.org/pods/XDecimalKit)
[![License](https://img.shields.io/cocoapods/l/XDecimalKit.svg?style=flat)](https://cocoapods.org/pods/XDecimalKit)
[![Platform](https://img.shields.io/cocoapods/p/XDecimalKit.svg?style=flat)](https://cocoapods.org/pods/XDecimalKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

XDecimalKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'XDecimalKit'
```

## Usage

`XDecimalKit`工具，保留小数位，传入double在最大程度保证精度。

```
/**
保留n位小数

@param point 保留小数点位数
@param dValue 双精度浮点数值
@param mode 舍入模式
@param type 小数位补齐类型
@return 格式化后的数值字符串
*/
+ (NSString *)decimalAfterPoint:(NSUInteger)point doubleValue:(double)dValue mode:(XDRoundMode)mode type:(XDZeroType)type;

......
```

`XDecimalKit+operation`工具，支持高精度数据运算。

```
/**
 加法运算

 @param addend 加数
 @param augend 被加数
 @return 结果
 */
+ (NSString *)decimalAdditionWithAddend:(NSString *)addend augend:(NSString *)augend;

......
```

## Author

liang.xv@qq.com

## License

XDecimalKit is available under the MIT license. See the LICENSE file for more info.
