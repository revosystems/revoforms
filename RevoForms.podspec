# EXAMPLE / TUTORIAL: https://www.raywenderlich.com/5823-how-to-create-a-cocoapod-in-swift


Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "RevoForms"
  spec.version      = "0.0.5"
  spec.summary      = "A library to easily create forms"

  spec.description  = "A simple library to easily create forms with a fluent syntax"

  spec.homepage     = "https://revo.works"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = "MIT"
  spec.swift_version = "5.0"


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author             = { "Jordi Puigdellívol" => "jordi@gloobus.net" }
  spec.social_media_url   = "https://instagram.com/badchoice2"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "11.3"
  spec.static_framework = true

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/revosystems/revoforms.git", :tag => "0.0.5" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "forms/lib/**/*.{swift,h}"#, "src/**/*.{h,m}"
  #spec.public_header_files = "forms/src/**/*.{h}"

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #  
  #spec.resources = "printers/resources/**/*"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #spec.xcconfig = { 'OTHER_SWIFT_FLAGS' => '-Xcc -Wno-error=non-modular-include-in-framework-module'}
  #spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  #spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


  spec.dependency 'RevoValidation', '~> 0.0.7'

end
