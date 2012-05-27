# -*- coding: utf-8 -*-
require File.expand_path('../lib/bimyou_segmenter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["nagadomi"]
  gem.email         = ["nagadomi@nurs.or.jp"]
  gem.description   = %q{Japanese word segmenter.}
  gem.summary       = %q{Japanese word segmenter.}
  gem.homepage      = "http://github.com/nagadomi/bimyou_segmenter"
  
  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bimyou_segmenter"
  gem.require_paths = ["lib"]
  gem.version       = BimyouSegmenter::VERSION

  gem.add_development_dependency "test-unit"
end
