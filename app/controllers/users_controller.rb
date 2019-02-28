class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @users = User.where(private: false).order("updated_at DESC").page(params[:page]).per(12)
  end
  def ranking 
     @users = User.all.order("pv DESC").first(10)
  end
  def show
    unless current_user == @user
    unless @user.pv.present?
      @user.pv = 0
    end
     @user.pv = @user.pv + 1
     @user.save
    end
    @topics = @user.topics.uniq
    @topic = Topic.new
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ユーザ登録しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザ登録できませんでした"
      render :new
    end
  end

  def edit
    
  end
  def destroy
  @user.destroy
  flash[:success] = "アカウントを削除しました"
  redirect_to root_url
  end
  def update
    
    if @user.update(user_params)
      flash[:success] = "ユーザの情報を変更しました"
      redirect_to root_url
    else
      flash.now[:danger] = "ユーザの情報を変更できませんでした"
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "ユーザを削除しました"
    redirect_to root_url
  end
  
  private 
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :private)
  end
   def correct_user
    @user = current_user
    unless @user
      redirect_to root_url
    end
  end
end
