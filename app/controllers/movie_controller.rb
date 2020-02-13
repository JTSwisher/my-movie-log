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

    post '/movies/api' do 
        @keyword = params[:keyword]
        erb :'/movies/results'
    end 

    get 'results/:keyword' do 
        url = "https://api.themoviedb.org/3/search/movie?api_key=7dd629038911a7d3dcf84371891ee64e&query=#{@keyword}"
        response = HTTParty.get(url) 
        reponse.parsed_response 
    end 

    post '/movies' do 
        if logged_in? 
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
        else 
            redirect '/login' 
        end 
    end

    get '/movies/:id' do 
        if logged_in?
            if @movie = current_user.movies.find_by(id: params[:id])
                erb :'/movies/show_movie'
            else 
                redirect'/error'
            end 
        else 
            redirect '/login' 
        end 
    end 

    get '/movies/:id/edit' do 
        if logged_in?
            if @movie = current_user.movies.find_by(id: params[:id])
                erb :'/movies/edit'
            else 
                redirect '/error'
            end 
        else 
            redirect '/login'
        end 
    end 

    get '/error' do 
        erb :'movies/error'
    end 

    patch '/movies/:id' do
        if  logged_in?
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
        else 
            redirect '/login'
        end 
    end 

   
    delete '/movies/:id' do 
        if logged_in?
            if @movie = current_user.movies.find_by(id: params[:id])
                @movie.delete 
                redirect "/movies"
            else 
                redirect '/error'
            end 
        else 
            redirect '/login'
        end 
    end 

end 