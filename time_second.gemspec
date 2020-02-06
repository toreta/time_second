require_relative 'lib/time_second'

Gem::Specification.new do |spec|
  spec.name          = 'time_second'
  spec.version       = ::TimeSecond::VERSION
  spec.authors       = ['ziguzagu']
  spec.email         = ['ziguzagu@gmail.com']

  spec.summary       = 'Make it easy to handle numeric value as seconds.'
  spec.description   = 'Make it easy to handle numeric value as seconds.'
  spec.homepage      = 'https://github.com/toreta/time_second'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = 'https://github.com/toreta/time_second/blob/master/CHANGELOG.md'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = []
  spec.require_paths = ['lib']

  spec.add_development_dependency 'minitest', '~> 5.8'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rubocop', '~> 0.79'
end
