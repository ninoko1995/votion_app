class UsersController < ApplicationController
  before_action :check_log_in, only:[:end,:index,:show]
  def new
    @user=User.new
  end

  def create
    if User.find_by(name: params[:session][:name]).blank?
      @user=User.new
      @user.name=params[:session][:name]
      @user.save
      log_in @user
      redirect_to new_investment_path
    else
      @user = User.find_by(name: params[:session][:name])
      log_in @user
      if @user.admin == true
        redirect_to candidates_path
      else
        #how to set flash message?
        flash = "すでに投票いただきました。"
        redirect_to user_end_path
      end
    end
  end

  def end
    log_out if !logged_in?
  end

  def edit
  end 
  
  def update
  end

  def index
    @users = User.order(:name)
  end

  def admin_index
    @users = User.order(:name)
  end


  def show
    @user = User.find(params[:id])
    @candidates = @user.candidates.order(:money)
  end

  # def destroy
  # end

  # private
  #   def user_params
  #     params.require(:user).permit(:name)
  #   end

end
