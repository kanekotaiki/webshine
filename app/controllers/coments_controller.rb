class ComentsController < ApplicationController
  def create
    @coment = current_user.coments.new(coment_params)
    @chat = @coment.chat
    if @coment.save
      flash[:success] = "投稿しました"
      redirect_to chat_path(@chat)
    else
      flash.now[:danger] = "投稿できませんでした"
      @coments = Coment.where(chat_id: @chat.id).order("updated_at DESC").page(params[:page])
      render "chats/show"
    end
  end

  def destroy
  end
  private
  def coment_params
    params.require(:coment).permit(:content, :chat_id)
  end
end
