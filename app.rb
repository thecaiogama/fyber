class FyberApp < Sinatra::Base

  include Helpers::FyberHelper

  get '/' do
    erb :index
  end

  get '/offers/:uid/:page/?:pub0?' do
    content_type :json
    content = show params['uid'], params['pub0'], params['page']

    content.to_json
  end

end
