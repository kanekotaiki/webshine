class MyshinesController < ApplicationController
  def index
  end
  def new
    @topic = Topic.find(params[:topic_id])
    @myshine = current_user.myshines.build(topic_id: @topic.id)
  end
  def create
    @myshine = current_user.myshines.new(shine_params)
    @topic = @myshine.topic
    if @myshine.save
      flash[:success] = "投稿しました"
      redirect_to topic_path(@topic, user_id: current_user.id)
    else 
      flash.now[:danger] = "投稿できませんでした"
      render "myshines/new"
    end
  end
  def destroy
    @myshine = Myshine.find(params[:id])
    @myshine.destroy
    flash[:success] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end
  private
  def shine_params
    params.require(:myshine).permit(:image, :topic_id)
  end
end
