# -*- coding: utf-8 -*-
$LOAD_PATH.unshift('/Library/RubyMotion/lib')
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError => e
  puts e.message
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'HelloMotion'
end
