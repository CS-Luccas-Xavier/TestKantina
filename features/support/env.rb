require 'nakal/cucumber'
require 'pry'

Nakal.platform = :android

if ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
  Nakal.platform = :ios
elsif ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  Nakal.platform = :android
end
