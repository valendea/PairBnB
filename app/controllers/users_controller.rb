class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def show
  	# render :show, layout: "abc"
  	# render means you go straight to app/views/users/show.html.erb
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        # redirect_to @user
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
      else
        # render :edit
        format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end  

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :photo)
  end

  def set_user
  	@user = User.find(params[:id])
  end
end
