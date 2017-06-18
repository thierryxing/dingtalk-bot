# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dingbot/version'

Gem::Specification.new do |spec|
  spec.name = "dingbot"
  spec.version = DingBot::VERSION
  spec.authors = ["Thierry Xing"]
  spec.email = ["thierry.xing@gmail.com"]

  spec.summary = %q{钉钉自定义机器人Ruby库}
  spec.description = %q{钉钉自定义机器人Ruby库}
  spec.homepage = "https://github.com/thierryxing/dingtalk-bot"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) {|f| File.basename(f)}
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'httparty', "~> 0.15.5"
  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency 'yard', "~> 0.9.5"
end
