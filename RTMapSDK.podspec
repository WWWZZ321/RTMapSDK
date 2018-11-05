#
# Be sure to run `pod lib lint RTMapSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RTMapSDK'
  s.version          = '0.1.0'
  s.summary          = 'A short description of RTMapSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/WWWZZ321/RTMapSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WWWZZ321' => 'zhangzhi@njfae.com' }
  s.source           = { :git => 'https://github.com/WWWZZ321/RTMapSDK.git', :tag => s.version.to_s , :submodules => true }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

    s.platform     = :ios, '8.0'
    s.requires_arc = true


   s.subspec 'ARSDK' do |ss|
   ss.source_files = 'RTMapSDK/Classes/RTM/SDK/ARSDK/include/*'
   ss.public_header_files = 'RTMapSDK/Classes/RTM/SDK/ARSDK/include/*.h'
   ss.vendored_libraries = 'RTMapSDK/Classes/RTM/SDK/ARSDK/libARSDK.a'
   ss.resources = 'RTMapSDK/Classes/RTM/SDK/ARSDK/RTImages.bundle'
   ss.dependency 'RTMapSDK/RTLbsLocation'
   end

   s.subspec 'RTLbsLocation' do |ss|
   ss.source_files = 'RTMapSDK/Classes/RTM/SDK/RTLbsLocationSDK/*.h'
   #s.public_header_files = 'RTMapSDK/Classes/RTM/SDK/RTLbsLocationSDK/*.h'
      ss.vendored_libraries = 'RTMapSDK/Classes/RTM/SDK/RTLbsLocationSDK/libRTLbsLocation.a'

      end

    s.subspec 'RTLbsMapSDK' do |ss|
    ss.source_files = 'RTMapSDK/Classes/RTM/SDK/RTLbsMapSDK/*.h'
    ss.public_header_files = 'RTMapSDK/Classes/RTM/SDK/RTLbsMapSDK/*.h'
    ss.vendored_libraries = 'RTMapSDK/Classes/RTM/SDK/RTLbsMapSDK/lib3DMapView.a'
    ss.resources = 'RTMapSDK/Classes/RTM/SDK/RTLbsMapSDK/RtmapRes.bundle'
    end


    s.frameworks = 'UIKit','CoreMotion','SystemConfiguration','CoreLocation','CoreBluetooth','Foundation','CoreGraphics'
    s.libraries = 'sqlite3','z'
    
    s.dependency 'iCarousel'
    s.dependency 'SDWebImage'
    s.dependency 'FLAnimatedImage'
    s.xcconfig     = {'OTHER_LDFLAGS' => '-ObjC'}
end
