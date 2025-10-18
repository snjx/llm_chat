# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def index
    @messages = Message.order(:id)
    @message  = Message.new
  end

  def create
    user_text = params.require(:message).fetch(:content)
    Message.create!(role: "user", content: user_text)

    # YAML設定に基づくプロバイダで実行
    response = ChatAgent.with(message: user_text).chat.generate_now
    Message.create!(role: "assistant", content: response.message.content)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  rescue => e
    Message.create!(role: "assistant", content: "（エラー）#{e.class}: #{e.message}")
    redirect_to root_path
  end
end
