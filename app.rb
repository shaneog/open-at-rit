require 'sinatra'

Encoding.default_external = 'utf-8'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
