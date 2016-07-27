get '/sessions/new' do
	
	
	erb :'/sessions/new'
end

post '/sessions' do 

	@user = User.find_by(email: params[:user][:email])

	if @user && @user.authenticate(params[:user][:password])
		session[:id] = @user.id

		redirect "/users/#{session[:id]}"
	else
		@error = "Log in info is incorrect, sorry boo."
		p @error

		redirect "/sessions/new"
	end

end


get '/sessions/delete' do
  logout(@user)
  redirect "/"
end