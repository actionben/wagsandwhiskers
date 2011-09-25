require 'rubygems'
require 'sinatra'
require 'haml'
require 'kramdown'

configure :production do
  before do
    if request.host != 'www.wagsandwhiskerspetcare.co.uk'
      redirect "http://www.wagsandwhiskerspetcare.co.uk"+request.fullpath, 301
    end
  end
end

module Kramdown
 include Haml::Filters::Base

 def render(text)
   ::Kramdown::Document.new(text).to_html
 end
end

get '/' do
  haml :index
end

get '/qr' do
  haml :index
end

get '/stylesheets/front.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :'stylesheets/front'
end
