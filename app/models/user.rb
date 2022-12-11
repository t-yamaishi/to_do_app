class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def admin_destroy_check
    if User.where(admin: true).count == 1 && self.admin == true
      throw(:abort)
    end
  end

  def admin_update_exist
    if User.where(admin: true).count == 1 && self.saved_change_to_admin== [true, false]
      throw(:abort)
    end
  end

end
