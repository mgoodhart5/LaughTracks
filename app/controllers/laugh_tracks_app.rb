class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    @comedians = Comedian.all
    @specials = Special.all
    erb :"index"
  end

end
