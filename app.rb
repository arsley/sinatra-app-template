require 'sinatra/base'
require 'sinatra/asset_pipeline'
require 'sprockets'

class App < Sinatra::Base
  configure do
    set :root, File.dirname(__FILE__)
    set :sprockets, Sprockets::Environment.new(root)
    sprockets.append_path File.join(root, 'assets', 'css')
    sprockets.append_path File.join(root, 'assets', 'js')
    register Sinatra::AssetPipeline
  end

  get '/' do
    slim :index
  end
end

