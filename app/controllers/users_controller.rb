class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def show
  	# render :show, layout: "abc"
  	# render means you go straight to app/views/users/show.html.erb
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end  

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def set_user
  	@user = User.find(params[:id])
  end
end
