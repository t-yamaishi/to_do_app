class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  validates :content, { presence: true }
  validates :content, length: { minimum: 1, maximum: 20 }
  enum status: { 未実施: 0, 実施: 1 }
  require 'line/bot'

  def self.deadline_check
    posts = Post.select(:id, :content, :deadline, :status, :user_id)
    posts.each do |post|
      if post.deadline? && (post.status = 0) && ((Time.now.strftime('%Y-%m-%d %H:%M')) == (post.deadline.strftime('%Y-%m-%d %H:%M')))
        ContactMailer.contact_mail(post).deliver
      end
      if post.user.uid? && post.deadline? && (post.status = 0) && ((Time.now.strftime('%Y-%m-%d %H:%M')) == (post.deadline.strftime('%Y-%m-%d %H:%M')))
        Post.line_push(post)
      end
    end
  end

  def self.client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
  end

  def self.line_push(post)
    message={
        type: 'text',
        text: "#{post.content}が実施されていません。"
        }
    user_id = post.user.uid
    response = Post.client.push_message(user_id, message)
  end
end
