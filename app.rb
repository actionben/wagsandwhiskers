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

helpers do
  def menu_items
    [{:text => "Home",
      :href => "/"},
     {:text => "Dogs",
      :href => "/dogs"},
     {:text => "Cats",
      :href => "/cats"},
     {:text => "Small animals",
      :href => "/small-animals"}
    ]
  end

  def menu_item(text, href)
    if request.path_info == href
      capture_haml do
        haml_tag 'li.current' do
          haml_tag 'span.text' do
            haml_concat text
          end
        end
      end
    else
      capture_haml do
        haml_tag 'li.current' do
          haml_tag :a, :href => href do
            haml_concat text
          end
        end
      end
    end
  end
  
  def footer
    "Wags and Whiskers will bring in newspapers, open and close curtains, water indoor plants, put out bins and turn lights on and off, to provide added security while you're away. Just ask if required."
  end
end

get '/' do
  @body_class = "index"
  haml :index
end

get '/dogs' do
  @body_class = "dogs"
  haml :dogs
end

get '/cats' do
  @body_class = "cats"
  haml :cats
end

get '/small-animals' do
  @body_class = "small_animals"
  haml :small_animals
end

get '/pricing' do
  @body_class = "pricing"
  haml :pricing
end

get '/qr' do
  haml :index
end

get '/stylesheets/front.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :'stylesheets/front'
end
