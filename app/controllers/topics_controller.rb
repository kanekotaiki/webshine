class TopicsController < ApplicationController
  
  def show
    @user = User.find(params[:user_id])
    @topic = Topic.find_by(id: params[:id])
    @myshines = @user.myshines.where(topic_id: @topic.id).order("created_at DESC").page(params[:page]).per(12)
    @topics = @user.topics.uniq
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
      if @topic.save
        flash[:success] = "ワードを保存しました"
        redirect_to current_user
      else 
        flash.now[:danger] = "ワードを保存できませんでした"
        @user = current_user
        @topics = @user.topics.uniq - [@topic]
        render "users/show"
      end
  end
  def destroy
    @topic = current_user.topics.find_by(id: params[:id])
    @topic.destroy
    flash[:success] = "削除しました"
   
    redirect_back(fallback_location: root_path)
  end
  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
