require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name = "RNDeliverer"
  s.version = package['version']
  s.summary = "Live streaming react native module"

  s.authors = { 'Name' => 'appssemble' }
  s.homepage = "http://appssemble.com"
  s.license = "MIT"

  s.platform = :ios, "10.3"
  s.framework    = 'UIKit'
  s.requires_arc = true

  s.source = { :git => "https://github.com/DylanVann/react-native-fast-image.git" }
  s.source_files = "ios/*.{h,m,swift}"

  s.dependency 'React'
  s.dependency 'Deliverer'

end