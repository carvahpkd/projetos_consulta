require 'capybara/cucumber'
require 'selenium-webdriver'
require 'faker'
require 'cpf_faker'
require 'rspec'
require 'site_prism'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox) # <-aqui seta o browser
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 60

Capybara.app_host = "http://google.com"