class Post < ApplicationRecord
  belongs_to :user
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings, source: :tag
  validates :content, {presence: true}
  enum status: {未実施:0, 実施:1}

  def self.deadline_check
    Post.all.each do |post|
      now = Time.now
      dead = post.deadline
      if (now.strftime("%Y-%m-%d %H:%M")) == (dead.strftime("%Y-%m-%d %H:%M")) #|| post.status = 0
        ContactMailer.contact_mail(post).deliver
      end
    end
  end

end
