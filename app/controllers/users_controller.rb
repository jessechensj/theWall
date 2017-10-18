class UsersController < ApplicationController
    def new
    end

    def create
        @user = User.new(params.require(:user).permit(:username))
        if User.find_by(username:@user.username)
          session[:user_id] = User.find_by(username:@user.username).id
          redirect_to '/messages'
        end
        if @user.save
          flash[:notice] = ['Welcome ' + @user.username]
          session[:user_id] = User.last.id
          redirect_to '/messages'
        else
          flash[:notice] = @user.errors.full_messages
          redirect_to '/users/new'
        end
    end
end
