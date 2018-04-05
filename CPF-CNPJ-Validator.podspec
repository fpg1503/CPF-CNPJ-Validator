Pod::Spec.new do |s|
  s.name = 'CPF-CNPJ-Validator'
  s.version = '1.0.2'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = '✅ A Swifty CPF and CNPJ validator'

  s.description      = <<-DESC
  A Swift library to validate CPF and CNPJ. Automatically strips formatting,
  covers valid numbers, wrong length, number sequences, and common fake numbers.
  Options can be passed to allow invalid number sequences, that's useful for
  testing.
                       DESC

  s.homepage         = 'https://github.com/fpg1503/CPF-CNPJ-Validator'
  s.authors = { 'Francesco Perrotti-Garcia' => 'fpg1503@gmail.com' }
  s.social_media_url = 'https://twitter.com/fpg1503'
  s.source = { :git => 'https://github.com/fpg1503/CPF-CNPJ-Validator.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
end
