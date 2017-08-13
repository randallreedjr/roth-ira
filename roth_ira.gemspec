require File.expand_path('../lib/roth_ira/version', __FILE__)

Gem::Specification.new do |s|
 s.name        = 'roth_ira'
 s.version     = RothIRA::VERSION
 s.authors     = ['Randall Reed']
 s.email       = ['randallreedjr@gmail.com']

 s.files       = Dir.glob('lib/**/*.rb') + %w(lib/limits.yaml)
 s.test_files  = Dir.glob("spec/**/*.rb")
 s.add_development_dependency 'rspec', '~> 3.3'

 s.summary     = 'Roth IRA Contribution Limit Calculator'
 s.description = 'Determines max Roth IRA contribution amount based on year, filing status, and MAGI'
 s.homepage    = 'http://github.com/randallreedjr/roth_ira'

 s.licenses    = ['MIT']
end
