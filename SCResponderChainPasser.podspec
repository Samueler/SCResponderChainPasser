Pod::Spec.new do |s|
  s.name             = 'SCResponderChainPasser'
  s.version          = '1.0.0'
  s.summary          = 'SCResponderChainPasser uses response chain to achieve cross-layer value transmission'
  s.homepage         = 'https://github.com/Samueler/SCResponderChainPasser.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Samueler' => 'chenty@mama.cn' }
  s.source           = { :git => 'https://github.com/Samueler/SCResponderChainPasser.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'SCResponderChainPasser/Classes/**/*'
end
