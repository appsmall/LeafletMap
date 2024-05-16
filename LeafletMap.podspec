#
# Be sure to run `pod lib lint LeafletMap.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LeafletMap'
  s.version          = '0.1.1'
  s.summary          = 'You can use this library to show osm map on the view'

  s.description      = <<-DESC
Leaflet is the leading open-source JavaScript library for mobile-friendly interactive maps. Weighing just about 42 KB of JS, it has all the mapping features most developers ever need.
                       DESC

  s.homepage         = 'https://github.com/appsmall/LeafletMap'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'appsmall' => 'rahulchopra.rc93@gmail.com' }
  s.source           = { :git => 'https://github.com/appsmall/LeafletMap.git', :tag => s.version.to_s }

  s.swift_version = '5.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'LeafletMap/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LeafletMap' => ['LeafletMap/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'Foundation', 'WebKit'
end
