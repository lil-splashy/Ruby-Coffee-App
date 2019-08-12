class UserController < ApplicationController

	#SHOW LOGIN PAGE
	get '/login' do
		erb :login
	end

	#DO LOGIN PAGE
	post '/login' do
		#find user by username
		user = User.find_by username: params[:username]

		pw = params[:password]

		if user && user.authenticate(pw)
			session[:logged_in] = true
			session[:username] = user.username
			session[:message] = {
				success: true,
				status: "good",
				message: "Logged in as #{user.username}"
			}

			redirect '/recipes'
		else
			session[:message] = {
				success: false,
				status: "bad",
				message: "Invalid username or password"
			}

			redirect '/users/login'
		end
	end

	#SHOW REGISTER PAGE
	get '/register' do
		erb :register
	end

	#DO REGISTRATION PAGE
	post '/register' do
		user = User.find_by username: params[:username]

		if !user
			user = User.new
			user.username = params[:username]

			user.password = params[:password]
			user.save

			session[:logged_in] = true
			session[:username] = user.username
			session[:message] = {
			}

			redirect '/recipes'

		else
			session[:message] = {
				success: false,
				status: "bad",
				message: "Sorry, that username is already taken. Try another one."
			}

			redirect '/users/register'
		end
	end

	#LOGOUT
	get '/logout' do
		username = session[:username]
		session.destroy
		session[:message] = {
			success: true,
			status: "neutral",
			message: "You are logged out, #{username}."
		}

		redirect '/users/login'
	end
end














