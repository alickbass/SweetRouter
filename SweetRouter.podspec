Pod::Spec.new do |s|
  s.name = "SweetRouter"
  s.version = "1.0.0"
  s.summary = "Declarative URL routing in swift for Alamofire and not only :)"
  s.homepage = "https://github.com/alickbass/SweetRouter"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Oleksii Dykan" => "alick_bass@mail.ru" }
  
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.requires_arc = true

  s.source = { :git => "https://github.com/alickbass/SweetRouter.git", :tag => s.version, :branch => 'master'}
  s.source_files = "SweetRouter/*.swift"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4' }

end
