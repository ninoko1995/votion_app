class UsersController < ApplicationController
  before_action :check_log_in, only: :end
  before_action :check_admin,only:[:index,:admin_index,:show]

  def new
    @user=User.new
  end

  def create
    if User.find_by(name: params[:session][:name]).blank?
      @user=User.create(name:params[:session][:name])
      log_in @user
      redirect_to new_investment_path
    else
      @user = User.find_by(name: params[:session][:name])
      log_in @user
      if @user.admin == true
        redirect_to candidates_path
      else
        redirect_to end_path,success:"すでに投票いただきました。"
      end
    end
  end

  def end
    log_out if !logged_in?
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

  # def edit
  # end 
  
  # def update
  # end

  # def destroy
  # end

  # private
  #   def user_params
  #     params.require(:user).permit(:name)
  #   end

end
