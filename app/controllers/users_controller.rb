class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    if User.find_by(name: params[:session][:name]).blank?
      @user=User.new
      @user.name=params[:session][:name]
      @user.save
    else
      @user = User.find_by(name: params[:session][:name])
    end
      log_in @user
      redirect_to new_investment_path
  end

  def end
  end


  def edit
  end 
  
  def update
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
  end

  # private
  #   def user_params
  #     params.require(:user).permit(:name)
  #   end

end
