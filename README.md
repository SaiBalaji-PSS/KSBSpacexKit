![Group 1](https://user-images.githubusercontent.com/51410810/88533915-a7276b80-d024-11ea-9f59-4c6546f7da4d.png)


# KSBSpacexKit - A wrapper for SpaceX REST API V4

[![CI Status](https://img.shields.io/travis/ksbalaji2000@outlook.com/KSBSpacexKit.svg?style=flat)](https://travis-ci.org/ksbalaji2000@outlook.com/KSBSpacexKit)
[![Version](https://img.shields.io/cocoapods/v/KSBSpacexKit.svg?style=flat)](https://cocoapods.org/pods/KSBSpacexKit)
[![License](https://img.shields.io/cocoapods/l/KSBSpacexKit.svg?style=flat)](https://cocoapods.org/pods/KSBSpacexKit)
[![Platform](https://img.shields.io/cocoapods/p/KSBSpacexKit.svg?style=flat)](https://cocoapods.org/pods/KSBSpacexKit)

https://cocoapods.org/pods/KSBSpacexKit

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

KSBSpacexKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KSBSpacexKit'
```

##  To get all Dragons
```swift
 SpaceXHub.sharedobj.getDragons { (daragons, error) in
            if error == nil
            {
                print(daragons.first!.heatShield)
                print(daragons.first!.launchPayloadMass)
                print(daragons.first!.launchPayloadVol)
                print(daragons.first!.returnPayloadMass)
                print(daragons.first!.returnPayloadVol)
            }
        }
```
## Author

ksbalaji2000@outlook.com, ksbalaji2000@outlook.com

## License

KSBSpacexKit is available under the MIT license. See the LICENSE file for more info.
