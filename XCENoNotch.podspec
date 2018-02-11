Pod::Spec.new do |s|

  s.name                      = 'XCENoNotch'
  s.summary                   = 'Make iPhone X notch elegantly disappear in your app.'
  s.version                   = '0.1.0'
  s.homepage                  = 'https://XCEssentials.github.io/NoNotch'

  s.source                    = { :git => 'https://github.com/XCEssentials/NoNotch.git', :tag => s.version }

  s.requires_arc              = true

  s.license                   = { :type => 'MIT', :file => 'LICENSE' }
  s.author                    = { 'Maxim Khatskevich' => 'maxim@khatskevi.ch' }

  # === iOS

  s.ios.deployment_target     = '9.0'

  s.ios.source_files          = 'Sources/NoNotch/**/*.swift'

  s.ios.dependency              'SnapKit', '~> 4.0.0'

end