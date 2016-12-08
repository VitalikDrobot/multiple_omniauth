class SessionsController < ApplicationController

	def new
	end

	def create
		@account = Account.find_by(uid: auth_params['uid'], provider: auth_params['provider'])
		unless @account
			@account = Account.create(uid: auth_params['uid'], provider: auth_params['provider'],
										user: User.find_or_create_by(email: auth_params['info']['email']))
		end
		session[:user_id] = @account.user_id
		redirect_to root_path
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

	private

	def auth_params
		request.env['omniauth.auth']
	end

end
