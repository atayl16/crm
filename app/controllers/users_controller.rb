class UsersController < ApplicationController
  before_action :authorize_admin, only: :create

  before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
    @users = User.all
  end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to edit_user_path, notice: 'The user was created successfully'
		else
			render :new
		end
	end

	def show
	end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_user_path, notice: 'The user was updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @user.delete
    redirect_to users_path, notice: 'The user was deleted successfully'
  end


private

  def authorize_admin
    return unless !current_user.type = AdminUser
    redirect_to root_path, alert: 'Admins only!'
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :type)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
