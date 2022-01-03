# EXAMPLE / TUTORIAL: https://www.raywenderlich.com/5823-how-to-create-a-cocoapod-in-swift


Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "RevoForms"
  spec.version      = "0.0.1"
  spec.summary      = "A library to easily create forms"

  spec.description  = "A simple library to easily create forms with a fluent syntax"

  spec.homepage     = "https://revo.works"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = "MIT"
  spec.swift_version = "5.0"


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author             = { "Jordi Puigdellívol" => "jordi@gloobus.net" }
  # Or just: spec.author    = "Jordi Puigdellívol"
  # spec.authors            = { "Jordi Puigdellívol" => "jordi@gloobus.net" }
  spec.social_media_url   = "https://instagram.com/badchoice2"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #  
  # spec.platform     = :ios
   #spec.platform     = :ios, "9.3"

  #  When using multiple platforms
   spec.ios.deployment_target = "10.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "10.0"

  spec.source       = { :git => "https://github.com/revosystems/revoforms.git", :tag => "0.0.1" }
  spec.source_files  = "forms/lib/**/*.{swift}"#, "src/**/*.{h,m}"


  spec.dependency "RevoValidation", "~> 0.0.5"

end
