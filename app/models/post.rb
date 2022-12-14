class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  validates :content, { presence: true }
  enum status: { 未実施: 0, 実施: 1 }

  def self.deadline_check
    Post.all.each do |post|
      if post.deadline? && (post.status = 0) && ((Time.now.strftime('%Y-%m-%d %H:%M')) == (post.deadline.strftime('%Y-%m-%d %H:%M')))
        ContactMailer.contact_mail(post).deliver
      end
    end
  end
end
