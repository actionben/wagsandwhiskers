require 'rubygems'
require 'sinatra'

get '/*' do
  halt 404
end
