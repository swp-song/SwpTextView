Pod::Spec.new do |s|

  s.name                  = "SwpTextView"
  s.version               = "1.0.1"
  s.ios.deployment_target = '7.0'
  s.summary               = " 封装自带 Placeholder TextView "
  s.homepage              = "https://github.com/swp-song/SwpTextView"
  s.license               = { :type => "MIT", :file => "LICENSE" }
  s.author                = { "swp-song" => "396587868@qq.com" }
  s.source                = { :git => "https://github.com/swp-song/SwpTextView.git", :tag => s.version }
  s.source_files          = "SwpTextView"
  s.requires_arc          = true
  s.framework             = "UIKit"

end
