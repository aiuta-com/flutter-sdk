#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint aiutasdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'aiuta_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Aiuta Virtual Try-On Flutter plugin.'
  s.description      = "Virtual Try-On Solution for Apparel and Fashion Businesses."
  s.homepage         = 'https://github.com/aiuta-com/flutter-sdk'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Aiuta' => 'Partnership@aiuta.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'AiutaSdk', '~> 3.0.8'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
