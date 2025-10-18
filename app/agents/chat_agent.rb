# app/agents/chat_agent.rb
class ChatAgent < ActiveAgent::Base
  action :reply do |message:|
    respond system: "You are a helpful assistant.",
            user: message
  end
end
