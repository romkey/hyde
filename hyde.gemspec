# frozen_string_literal: true

require_relative 'lib/hyde/version'

Gem::Specification.new do |spec|
  spec.name = 'hyde'
  spec.version = Hyde::VERSION
  spec.authors = ['John Romkey']
  spec.email = ['58883+romkey@users.noreply.github.com']

  spec.summary = 'Jekyll draft and post manager'
  spec.description = 'Generates Jekyll drafts and publishes them'
  spec.homepage = 'https://github.com/romkey/hyde'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.7.4'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/romkey/hyde'
#  spec.metadata['changelog_uri'] = 'TODO: Put your gem's CHANGELOG.md URL here.'

  all_files  = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.files = all_files.grep(%r!^(exe|lib|rubocop)/|^.rubocop.yml$!)
  spec.executables   = all_files.grep(%r!^exe/!) { |f| File.basename(f) }
  spec.bindir        = 'exe'
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 1.2.1'
end
