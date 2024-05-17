#
# Be sure to run `pod lib lint LeafletMap.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LeafletMap'
  s.version          = '0.1.2'
  s.summary          = 'Leaflet map integration for iOS applications using WebView.'

  s.description      = <<-DESC
  LeafletMap is a simple and efficient library for integrating open street map into iOS applications. It provides an easy-to-use interface to display interactive maps, markers, and various map layers within your app using a WebView. Whether you are developing a travel app, a location-based service, or any application requiring map functionality, LeafletMap offers a lightweight and customizable solution. Features include:
  
  - Easy integration of Leaflet maps within a WebView.
  - Support for custom markers, popups, and layers.
  - Smooth interaction with pinch-zoom and panning gestures.
  - Compatibility with various tile providers and map styles.
  - Ability to add custom overlays and GeoJSON data.
  - Simple API for managing map elements and events.

  LeafletMap ensures that you can bring the power and flexibility of Leaflet.js to your iOS applications with minimal effort.
  
  DESC

  s.homepage         = 'https://github.com/appsmall/LeafletMap'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'appsmall' => 'rahulchopra.rc93@gmail.com' }
  s.source           = { :git => 'https://github.com/appsmall/LeafletMap.git', :tag => s.version.to_s }

  s.swift_version = '5.0'
  s.ios.deployment_target = '12.0'

  s.source_files = 'LeafletMap/Classes/**/*'
  
  s.private_header_files = 'LeafletMap/Classes/**/*.{h,m,swift}'
  
  # s.resource_bundles = {
  #   'LeafletMap' => ['LeafletMap/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'Foundation', 'WebKit'
end
