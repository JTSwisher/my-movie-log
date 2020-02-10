class MovieController < ApplicationController 

    get '/movies' do 
        erb :'/movies/movies'
    end 

    get '/movies/new' do 
        erb :'/movies/new'
    end 

    post '/movies' do 
        binding.pry
    end

    get '/movies/:id' do 

    end 

    get '/movies/:id/edit' do 

    end 

    patch '/movies/:id' do 

    end 

    put '/movies/:id' do 

    end 

    delete '/movies/:id' do 

    end 

end 