Pod::Spec.new do |spec|

  spec.name         = "RevoForms"
  spec.version      = "0.0.1"
  spec.summary      = "Swift forms made simple"
  spec.description  = "A simple library to create swift forms and bind to a model"
  spec.homepage     = "https://revo.works"
  spec.license      = "MIT"
  spec.swift_version = "5.3"


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author             = { "Jordi Puigdellívol" => "jordi@gloobus.net" }
  spec.social_media_url   = "https://instagram.com/badchoice2"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "11.3"
  spec.static_framework = true

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "git@github.com:revosystems/revoforms.git", :tag => "0.0.1" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "forms/lib/**/*.{swift,h}"#, "src/**/*.{h,m}"
  #spec.public_header_files = "forms/src/**/*.{h}"

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #  
  #spec.resources = "printers/resources/**/*"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #spec.xcconfig = { 'OTHER_SWIFT_FLAGS' => '-Xcc -Wno-error=non-modular-include-in-framework-module'}
  #spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  #spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


  spec.dependency 'RevoValidation', '~> 0.0.21'

end
