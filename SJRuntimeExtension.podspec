#
# Be sure to run `pod lib lint SJRuntimeExtension.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SJRuntimeExtension'
  s.version          = '1.0.0'
  s.summary          = 'Runtime常用示例'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Runtime常用操作示例
 1.消息发送机制
 2.利用消息发送机制动态添加方法 动态方法解析 重定向 消息转发
 3.获取成员变量列表
 4.获取属性列表
 5.动态添加属性
 6.交换方法
                       DESC

  s.homepage         = 'https://github.com/SoulJaZhao/SJRuntimeExtension'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'SoulJaZhao' => 'superzhaolong@126.com' }
  s.source           = { :git => 'https://github.com/SoulJaZhao/SJRuntimeExtension.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SJRuntimeExtension/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SJRuntimeExtension' => ['SJRuntimeExtension/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
