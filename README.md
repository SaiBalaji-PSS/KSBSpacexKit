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
.Xcode </br>
.CocoaPod </br>

## Installation

KSBSpacexKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KSBSpacexKit'
```

##  To get all dragons data
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

## To get all  crew members data
```swift
   SpaceXHub.sharedobj.getCrewMembers { (crew, error) in
            if error == nil
            {
                print(crew.first!.id)
                print(crew.first!.name)
                print(crew.first!.agency)
                print(crew.first!.launches.first!.description)
                print(crew.first!.image)
            }
        }

```

## To get all capsule data
```swift
  SpaceXHub.sharedobj.getCapsules { (capsules, error) in
            if error == nil
            {
                print(capsules.first!.id)
                print(capsules.first!.landLandings)
                print(capsules.first!.lastUpdate!)
                print(capsules.first!.reuseCount)
                print(capsules.first!.status)
            }
            
        }
```
## To get all landpads data
```swift
 SpaceXHub.sharedobj.getLandPads { (landpads, error) in
                if error == nil
                {
                    print(landpads.first!.id)
                    print(landpads.first!.fullName)
                    print(landpads.first!.details)
                    print(landpads.first!.landingAttempts)
                    print(landpads.first!.landingSuccesses)
                    print(landpads.first!.launches.first!.description)
                    
                }
            }
```

## To get all data about Tesla Roadster
```swift
      SpaceXHub.sharedobj.getRoadster { (roadster, error) in
                if error == nil
                {
                    print(roadster.details)
                    print(roadster.apoapsisAu)
                    print(roadster.earthDistanceKM)
                    print(roadster.epochJd)
                    print(roadster.flickrImages)
                }
            }
```
## To get all Starlinks data
```swift
 SpaceXHub.sharedobj.getStarlinks { (w, e) in
                   print(w.first!.spaceTrack.countryCode)
                   
                
               }
```
## To get all Ships data
```swift
SpaceXHub.sharedobj.getShips{(s,e) in
            print("HOME PORT \(s.first!.homePort.rawValue)")
            print(s.first!.id)
            print(s.first!.active)
            
        }
```
## To get all Launchpads data
```swift
 SpaceXHub.sharedobj.getLaunchPads { (launchpad, error) in
                if error == nil
                {
                    print(launchpad.first!.id)
                    print(launchpad.first!.fullName)
                    print(launchpad.first!.latitude)
                     print(launchpad.first!.longitude)
                     print(launchpad.first!.locality)
                }
            }
```



## Author

ksbalaji2000@outlook.com

## License

KSBSpacexKit is available under the MIT license. See the LICENSE file for more info.
