#
#  Be sure to run `pod spec lint NEUtility.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
s.name             = "NEUtility"
s.version          = "0.0.1"
s.summary          = "Utility for iOS development"
s.homepage         = "https://github.com/NEIL0814/NEUtility"
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { "NEIL" => "522989049@qq.com" }
s.source           = { :git => "https://github.com/NEIL0814/NEUtility.git", :tag => s.version.to_s }

s.platform     = :ios, '7.0'
s.requires_arc = true
s.source_files = 'NEUtility/*.{h,m}'
s.public_header_files = 'NEUtility/*.h'
s.frameworks = 'Foundation', 'UIKit'
s.dependency 'MBProgressHUD'
end
