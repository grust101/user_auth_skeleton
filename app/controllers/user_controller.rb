get '/users/new' do
	erb :'/users/new'
end

post '/users' do

	@user = User.new(params[:user])


	if @user.save
		login(@user)

		redirect "/users/#{current_user.id}"
	else
		@error = "Looks like that account already exists. Please try again or log in"
		p @error
	end

end

get '/users/:id' do 

@user = User.find(params[:id])

erb :'/users/show'

end