
Pod::Spec.new do |s|
  s.name         = "study"
  s.version      = "0.2.0"
  s.summary      = "HTCopyableLabel is a subclass of UILabel that makes it easy to allow users to copy a label's text."
  s.homepage     = "https://github.com/aluoshuai/podtest"

  s.license      = { :type => 'MIT', :file => 'LICENSE.txt' }
  s.author       = { "罗帅" => "5793348@qq.com" }
  s.source       = { :git => "https://github.com/aluoshuai/podtest.git", :tag => "0.2.0" }
  s.source_files  = 'study/pod/**/*.{h,m}'
  s.platform     = :ios
  s.ios.deployment_target = '5.0'
  s.requires_arc = true
end

