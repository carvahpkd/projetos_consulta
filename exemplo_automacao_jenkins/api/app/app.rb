# app.rb
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader' if development?

require_relative 'routes/posts'

get '/' do
  @env = ENV['RACK_ENV'].to_s.upcase
  "Welcome to nBlog API v3.0 | Environment: #{@env}."
end
