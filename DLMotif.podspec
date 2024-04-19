Pod::Spec.new do |s|
  s.name = 'DLMotif'
  s.module_name = 'Motif'
  s.version = '0.4.0'
  s.license = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  s.osx.deployment_target = '10.14'
  s.ios.deployment_target  = '12.0'
  s.summary = 'A lightweight and customizable stylesheet framework for iOS'
  s.homepage = "https://github.com/erichoracek/#{s.module_name}"
  s.author = { 'Eric Horacek' => 'eric@automatic.com' }
  s.source = {
    :git => "https://github.com/sdkdimon/#{s.module_name}.git",
    :tag => s.version.to_s
  }
  s.frameworks = 'Foundation'
  s.ios.frameworks = 'UIKit'
  s.osx.frameworks = 'CoreGraphics'
  s.module_map = "#{s.module_name}/#{s.module_name}.modulemap"

  s.source_files = [
    "#{s.module_name}/#{s.module_name}.h",
    "#{s.module_name}/Core/*.{h,m}",
    "#{s.module_name}/Objective-C Runtime/*.{h,m}",
    "#{s.module_name}/YAML Serialization/*.{h,m}",
    'Carthage/Checkouts/libyaml/config.h',
    'Carthage/Checkouts/libyaml/src/*.{h,c}',
    'Carthage/Checkouts/libyaml/include/*.{h,c}',
  ]
  s.project_header_files = 'Carthage/Checkouts/libyaml/**/*.h'
  s.private_header_files = "#{s.module_name}/Core/*Private.h"
  s.ios.source_files = [
    "#{s.module_name}/iOS Support/*.{h,m}"
  ]
  s.osx.source_files = [
    "#{s.module_name}/iOS Support/*CG*.{h,m}"
  ]

  s.xcconfig = {
    'OTHER_CFLAGS' => '-DHAVE_CONFIG_H -Wno-shorten-64-to-32'
  }
end