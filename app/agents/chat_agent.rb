# app/agents/chat_agent.rb
class ChatAgent < ApplicationAgent
  def chat
    prompt(message: params[:message], content_type: :text)
  end
end
