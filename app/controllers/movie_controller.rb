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
        if logged_in?
            erb :'/movies/new'
        else 
            redirect '/login'
        end 
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
            if @movie = current_user.movies.find_by(id: params[:id])
                erb :'/movies/show_movie'
            else 
                redirect'/movies'
            end 
        else 
            redirect '/login' 
        end 
    end 

    get '/movies/:id/edit' do 
        if logged_in?
            @movie = current_user.movies.find(params[:id])
            erb :'/movies/edit'
        else 
            redirect '/login'
        end 
    end 

    patch '/movies/:id' do
        if  logged_in?
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
            redirect '/login'
        end 
    end 

   
    delete '/movies/:id' do 
        if logged_in?
            @movie = current_user.movies.find(params[:id])
            @movie.delete 
            redirect "/movies"
        else 
            redirect '/login'
        end 
    end 

end 