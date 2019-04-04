#
# Be sure to run `pod lib lint SwpTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwpTextView'
  s.version          = '3.1.0'
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

  
  s.ios.deployment_target = '9.0'

  s.default_subspec = 'Object-C'
  
  # Object-C
  s.subspec 'Object-C' do |oc|
    oc.ios.deployment_target = '9.0'
    oc.source_files = 'SwpTextView/Object-C/Code/*.{h,m}'
    oc.resource     = 'SwpTextView/Object-C/Resources/SwpTextView.bundle'
  end
  
  s.subspec 'Swift' do |swift|
    swift.ios.deployment_target = '12.0'
    swift.source_files = 'SwpTextView/Swift/Code/*.swift'
    
  end
  
  s.swift_versions = ['4.2', '5.0']
  s.frameworks    = 'UIKit'
  s.requires_arc  = true
  
end
