#
# Be sure to run `pod lib lint KSBSpacexKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KSBSpacexKit'
  s.version          = '0.1.0'
  s.swift_version = '5.2'
  s.summary          = 'A wrapper for SpaceX REST API'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'This Cocoa pod act as a wrapper class for SpaceX API to simplify the API request in iOS application.'
                       DESC

  s.homepage         = 'https://github.com/SaiBalaji22/KSBSpacexKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ksbalaji2000@outlook.com' => 'ksbalaji2000@outlook.com' }
  s.source           = { :git => 'https://github.com/SaiBalaji22/KSBSpacexKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'KSBSpacexKit/Classes/*.swift'
  
  # s.resource_bundles = {
  #   'KSBSpacexKit' => ['KSBSpacexKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
