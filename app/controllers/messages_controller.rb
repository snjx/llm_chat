# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  def index
    @messages = Message.order(:id)
    @message  = Message.new
  end

  def create
    user_text = params.require(:message).fetch(:content)
    Message.create!(role: "user", content: user_text)

    # 直近20件のメッセージ履歴を取得
    history = Message.order(:id).last(20).map { |m| { role: m.role, content: m.content } }
    # ユーザーのメッセージを追加
    messages = history + [ { role: "user", content: user_text } ]

    # ChatAgentを呼び出して応答を生成
    resp = ChatAgent.with(messages: messages).chat.generate_now
    # 応答メッセージを保存
    Message.create!(role: "assistant", content: resp.message.content)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.turbo_stream
    end
  rescue => e
    Message.create!(role: "assistant", content: "（エラー）#{e.class}: #{e.message}")
    redirect_to root_path
  end
end
