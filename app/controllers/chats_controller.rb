class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @chats = Chat.all.uniq
  end
  def show
    @chat = Chat.find(params[:id])
    @coment = current_user.coments.new(chat_id: @chat.id)
    @coments = Coment.where(chat_id: @chat.id).order("updated_at DESC").page(params[:page])
  end
  def create
    @chat = current_user.chats.new(chat_params)
    if @chat.save
      flash[:success] = "投稿しました"
      redirect_to chats_path
    else
      flash.now[:danger] = "投稿できません"
      @chats = Chat.all.uniq
      render "chats/index"
    end
  end
  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    flash[:success] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end
  private
  def chat_params
    params.require(:chat).permit(:title)
  end
end
