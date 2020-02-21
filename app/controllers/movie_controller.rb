class MovieController < ApplicationController 

    get '/movies' do
        active_login
          @movies = current_user.movies.all
          erb :'movies/movies'
    end 

    get '/movies/new' do 
        active_login
            erb :'/movies/new'
    end 

    post '/movies/api' do 
        @results = Movie.fetch(params[:keyword])
        erb :'/movies/results'
    end 

    post '/movies' do 
        active_login
            if params[:title] == "" || params[:rating] == "" || params[:comments] == "" || params[:date] == ""
                redirect :'/movies/new'
            else 
            @movie = current_user.movies.build(title: params[:title], rating: params[:rating], comments: params[:comments], date: params[:date], poster: params[:poster])
                if @movie.save
                    redirect "/movies/#{@movie.id}"
                else 
                    redirect '/movies/new'
                end 
            end
    end

    get '/movies/:id' do 
        active_login
            if @movie = current_user.movies.find_by(id: params[:id])
                erb :'/movies/show_movie'
            else 
                redirect'/error'
            end 
    end 

    get '/movies/:id/edit' do 
        active_login
            if @movie = current_user.movies.find_by(id: params[:id])
                erb :'/movies/edit'
            else 
                redirect '/error'
            end 
    end 

    get '/error' do 
        erb :'movies/error'
    end 

    patch '/movies/:id' do
        active_login
            if @movie = current_user.movies.find_by(id: params[:id])
                if params[:title] == "" || params[:rating] == "" || params[:comments] == "" || params[:date] == ""
                    redirect "/movies"
                else 
                    @movie = current_user.movies.find(params[:id])
                    @movie.title = params[:title]
                    @movie.rating = params[:rating]
                    @movie.comments = params[:comments]
                    @movie.date = params[:date]
                    @movie.save
                    redirect "/movies/#{@movie.id}"
                end
            else
                redirect '/error'
            end      
    
    end 

   
    delete '/movies/:id' do 
        active_login
            if @movie = current_user.movies.find_by(id: params[:id])
                @movie.delete 
                redirect "/movies"
            else 
                redirect '/error'
            end 
    end 


end 