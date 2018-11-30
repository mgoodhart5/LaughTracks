class LaughTracksApp < Sinatra::Base

  get '/comedians' do
    if params[:age]
      @comedians = Comedian.where(age:params[:age])
    else
      @comedians = Comedian.all
    end
    @total_count = Special.where(comedian_id: @comedians).count
    @average_run_time = Special.where(comedian_id: @comedians).average(:run_time)
    @hometowns = @comedians.unique_list_of_hometowns
    @average_age = @comedians.average_age
    erb :"index"
  end

end
