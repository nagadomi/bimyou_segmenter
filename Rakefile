#!/usr/bin/env rake
require "bundler/gem_tasks"

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'test'
  test.test_files = Dir.glob("test/**/*_test.rb")
  test.verbose = true
  test.warning = true
end
