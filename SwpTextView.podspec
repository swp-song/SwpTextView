#
# Be sure to run `pod lib lint SwpTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwpTextView'
  s.version          = '2.3.3'
  s.summary          = ' 简单封装 TextView '

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: 简单封装 TextView
                       DESC

  s.homepage         = 'https://github.com/swp-song/SwpTextView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'swp-song' => '396587868@qq.com' }
  s.source           = { :git => 'https://github.com/swp-song/SwpTextView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files  = 'SwpTextView/Class/**/*.{h,m}'
  s.resource      = 'SwpTextView/Resources/SwpTextView.bundle'

  # s.resource_bundles = {
  #   'SwpTextView' => ['SwpTextView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks    = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.requires_arc  = true
end
