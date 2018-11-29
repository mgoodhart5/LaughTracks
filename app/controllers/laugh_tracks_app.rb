class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.list(params)
    @specials = Special.all
    erb :"index"
  end

end
