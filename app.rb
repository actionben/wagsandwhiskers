require 'rubygems'
require 'sinatra'
require 'haml'
require 'maruku'

# configure :production do
#   before do
#     if request.host != 'www.wagsandwhiskers.co.uk'
#       redirect "http://www.wagsandwhiskers.co.uk"+request.fullpath, 301
#     end
#   end
# end

get '/' do
  haml :index
end

get '/stylesheets/front.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :'stylesheets/front'
end
