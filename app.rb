class FyberApp < Sinatra::Base

  include Helpers::FyberHelper

  get '/' do
    erb :index
  end

  get '/offers/:uid/:pub0/:page' do
    content_type :json
    content = show params['uid'], params['pub0'], params['page']

    content.to_json
  end

end
