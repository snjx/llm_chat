# app/agents/chat_agent.rb
class ChatAgent < ApplicationAgent
  def chat
    msgs = Array(params[:messages])
    raise ArgumentError, "messages is empty" if msgs.empty?

    stitched = msgs.map { |m|
      role = m[:role].to_s.capitalize
      "#{role}: #{m[:content]}"
    }.join("\n") + "\nAssistant:"

    Rails.logger.debug("[ChatAgent] stitched message: #{stitched.inspect}")

    prompt(message: stitched, content_type: :text)
  end
end
