require 'line/bot'
class LinebotController < ApplicationController
  skip_before_action :authenticate_user!
  protect_from_forgery :except => [:callback]

  def client
    client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end
    events = client.parse_events_from(body)
    events.each do |event|
      user_id = event['source']['userId']
      user = User.where(uid: user_id)[0]
      if event.message['text'].include?("予定")
        user_messages = reply_seven_days_plans(user)
        message = {
            type: 'text',
            text: user_messages
          }
      else
        user_message = "予定確認であれば、予定　と入力してください"
        message = {
            type: 'text',
            text: user_message
          }
      end
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          client.reply_message(event['replyToken'], message)
        end
      end
    end
    head :ok
  end

  private

  def reply_seven_days_plans(user)
    limit_days = Date.today..Time.now.end_of_day + (7.days)
    limit_days_plans =  Post.where(user_id: user.id).where(deadline: limit_days).order(deadline: "ASC")
    if limit_days_plans == []
      responce = "一週間以内の予定はありません。"
    else
      limit_columns_plans = limit_days_plans.pluck(:content, :deadline)
      seven_days_messages = []
      limit_columns_plans.each do |plan|
        seven_days_messages.push("「#{plan[0]}」は#{plan[1].strftime('%Y-%m-%d %H:%M')} までに行なってください。")
      end
      "#{seven_days_messages.join("\n")}"
    end
  end
end
