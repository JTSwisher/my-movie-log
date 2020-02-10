class MovieController < ApplicationController 

    get '/movies' do
        if logged_in?
          @movies = current_user.movies.all
          erb :'movies/movies'
        else
          redirect to '/login'
        end
    end 

    get '/movies/new' do 
        erb :'/movies/new'
    end 

    post '/movies' do 
        if logged_in? 
            if params[:title] == "" || params[:rating] == "" || params[:comments] == "" || params[:date] == ""
                redirect :'/movies/new'
            else 
            @movie = current_user.movies.build(title: params[:title], rating: params[:rating], comments: params[:comments], date: params[:date])
                if @movie.save
                    redirect "/movies/#{@movie.id}"
                else 
                    redirect '/movies/new'
                end 
            end
        else 
            redirect '/login' 
        end 
    end

    get '/movies/:id' do 
        if logged_in?
            @movie = current_user.movies.find(params[:id])
            erb :'/movies/show_movie'
        else 
            redirect '/login' 
        end 
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