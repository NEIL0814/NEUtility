# NEUtility
Utility for iOS development

[![CI Status](http://img.shields.io/travis/NEIL/NEUtility.svg?style=flat)](https://travis-ci.org/NEIL/NEUtility)
[![Version](https://img.shields.io/cocoapods/v/NEUtility.svg?style=flat)](http://cocoapods.org/pods/NEUtility)
[![License](https://img.shields.io/cocoapods/l/NEUtility.svg?style=flat)](http://cocoapods.org/pods/NEUtility)
[![Platform](https://img.shields.io/cocoapods/p/NEUtility.svg?style=flat)](http://cocoapods.org/pods/NEUtility)

# Usage

##Simple usage
include it in header
```objective-c
#inclue "NEUtility.h"
```

Some useful marco is provided :)
```objective-c
NEString(@"key")

UIColorWith256RGB(255, 255, 255)
UIColorWith256ARGB(255, 255, 255, 255)
UIColorWithRGB(1, 1, 1)
UIColorWithARGB(1, 1, 1, 1)

DLog(@"Hello world!");
```

##NEAnalogView
This is a view build with UIView, it is trying to simulate AnalogView.

##NEButton / NEView / NEImageView
It can also use in storyboard

cornerRadius : To make a round corner button without 1 line coding :)
verticalAlignTextAndImage : To create a button with Image(Top) & Text(Bottom)

## Requirements
Language : objective-c
Platform : iOS 8+

## Installation

NEUtility is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NEUtility"
```

## Author

NEIL, 522989049@qq.com

## License

NEUtility is available under the MIT license. See the LICENSE file for more info.
