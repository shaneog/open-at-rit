require 'sinatra'
require 'yaml'
require 'chronic'

Encoding.default_external = 'utf-8'

class App < Sinatra::Base

  locations = YAML.load_file('locations.yml')['locations']

  get '/' do
    erb :index, locals: { locations: locations }
  end

end

# Only run it when called as `ruby your_app_file.rb`
App.run! if $0 == __FILE__
