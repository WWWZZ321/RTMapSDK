#
# Be sure to run `pod lib lint RTMapSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RTMapSDK'
  s.version          = '0.1.3'
  s.summary          = 'A short description of RTMapSDK.'

  s.description      = <<-DESC
                    室内地图导航SDK
                    RTLbsMapSDK 地图绘制库，可单独使用
                    RTLbsLocation 室内定位
                    ARSDK AR导航，依赖另外两个库
                         DESC

  s.homepage         = 'https://github.com/WWWZZ321/RTMapSDK'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WWWZZ321' => 'zhangzhi@njfae.com' }
  s.source           = { :git => 'https://github.com/WWWZZ321/RTMapSDK.git', :tag => s.version.to_s , :submodules => true }

  s.ios.deployment_target = '8.0'

    s.platform     = :ios, '8.0'
    s.requires_arc = true


   s.subspec 'ARSDK' do |ss|
   ss.source_files = 'RTMapSDK/Classes/RTM/SDK/ARSDK/include/*'
   ss.public_header_files = 'RTMapSDK/Classes/RTM/SDK/ARSDK/include/*.h'
   ss.vendored_libraries = 'RTMapSDK/Classes/RTM/SDK/ARSDK/libARSDK.a'
   ss.resources = 'RTMapSDK/Classes/RTM/SDK/ARSDK/RTImages.bundle'
   ss.dependency 'RTMapSDK/RTLbsLocation'
   ss.dependency 'RTMapSDK/RTLbsMapSDK'
   ss.frameworks = 'CoreGraphics','QuartzCore','ImageIO','CoreMedia','CoreVideo','AVFoundation'
   ss.libraries = 'c++'
   end

   s.subspec 'RTLbsLocation' do |ss|
   ss.source_files = 'RTMapSDK/Classes/RTM/SDK/RTLbsLocationSDK/*.h'
      ss.vendored_libraries = 'RTMapSDK/Classes/RTM/SDK/RTLbsLocationSDK/libRTLbsLocation.a'
      ss.frameworks = 'UIKit','CoreMotion','SystemConfiguration','CoreLocation','CoreBluetooth','Foundation','CoreGraphics'
      ss.libraries = 'c++','z','sqlite3'
      end

     s.subspec 'RTLbsMapSDK' do |ss|
    ss.source_files = 'RTMapSDK/Classes/RTM/SDK/RTLbsMapSDK/*.h'
     ss.vendored_libraries = 'RTMapSDK/Classes/RTM/SDK/RTLbsMapSDK/lib3DMapView.a'
    ss.resources = 'RTMapSDK/Classes/RTM/SDK/RTLbsMapSDK/RtmapRes.bundle'
    ss.frameworks = 'CoreLocation','CoreBluetooth','UIKit','Foundation','CoreGraphics','OpenGLES','QuartzCore'
    ss.libraries = 'c++','z','sqlite3'
    end


    s.frameworks = 'UIKit','CoreMotion','SystemConfiguration','CoreLocation','CoreBluetooth','Foundation','CoreGraphics'
    s.libraries = 'sqlite3','z','c++'

    s.pod_target_xcconfig  = {'OTHER_LDFLAGS' => '-ObjC'}
    s.xcconfig = {'OTHER_CFLAGS' => '-fembed-bitcode'}
end
