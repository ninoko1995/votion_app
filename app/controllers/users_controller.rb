class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    @user=User.new
    @user.name=params[:user][:name]
    @user.save
    redirect_to new_investment_path
  end

  def end
  end


  def edit
  end 
  
  def update
  end

  def index
  end

  def show
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end

end
