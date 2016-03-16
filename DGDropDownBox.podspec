
Pod::Spec.new do |s|
  s.name            = "DGDropDownBox"
  s.version         = "0.0.1"
  s.summary          = "A dropDownMenu on iOS"
  s.description      = "A dropDownMenu, which implement by Objective-C"
  s.homepage         = "https://github.com/yandeguangzy/DGDropDownBox.git"
  # s.screenshots      = "http://a2.qpic.cn/psb?/V10AI9AY3CwCiW/n66PqQHNIijHlGv1LGCBDcHY6C70jD7H5iIHqCFelJw!/b/dH4BAAAAAAAA&bo=nQH0AgAAAAACFFo!&rf=viewer_4"
  s.license          = 'MIT'
  s.author           = { "yandeguangzy" => "13311171405@163.com" }
  s.source           = { :git => "https://github.com/yandeguangzy/DGDropDownBox.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://github.com/RickHe'

  s.platform     = :ios, '7.0'
  # s.ios.deployment_target = '7.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'DGDropBoxView/DGDropBoxView*.{h,m},DGDropBoxView/DGDropViewDelegate.h'
  #s.resources = "XYDropDownMenu/Images/*.png"
  s.frameworks = 'Foundation', 'UIKit'

end
