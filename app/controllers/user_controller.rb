class UserController < ApplicationController 

    get "/signup" do 
        erb :'/users/signup'
    end 

    post '/signup' do
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
          redirect to '/signup'
        else
          @user = User.new(username: params[:username], email: params[:email], password: params[:password])
          if @user.save
            session[:user_id] = @user.id
            redirect to '/account'
          else 
            redirect to '/signup_failure'
          end
        end
    end

    get '/signup_failure' do 
        erb :'/users/signup_failure'
    end 

    get '/login' do 
        erb :'/users/login'
    end 

    post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect "/account"
		else
			redirect "/failure"
		end
    end 

    get '/account' do 
        if logged_in?
            @user = User.find(session[:user_id])
            erb :'/users/account'
        else 
            redirect "/login"
        end 
    end 

    get '/failure' do 
        erb :'users/failure'
    end 

    get "/logout" do
		  session.clear
		  redirect "/"
    end

end 