Pod::Spec.new do |s|
  s.name             = "podtest"
  s.version          = "0.2.0"
  s.summary          = "podtest Testing."

  s.homepage         = "https://github.com/aluoshuai/podtest"
  s.license          = "MIT(example)"

  s.author           = { "luoshuai" => "5793348@qq.com" }
  s.source           = { :git => "https://github.com/aluoshuai/podtest.git", :tag => "0.2.0" }
  s.requires_arc = true

  s.source_files = "pod/**/*.{h.m}"
  s.public_header_files = "pod/**/*.h"
end
