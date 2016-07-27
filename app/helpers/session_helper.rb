helpers do 



	def login(user)
		session[:id] = user.id
	end


	def current_user
		@current_user ||= User.find_by(id: session[:id])
	end


	def logout(user)
		session[:id] = nil
		current_user = nil

	end
	
end