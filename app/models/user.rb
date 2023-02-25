class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, { presence: true }

  has_many :posts, dependent: :destroy

  has_many :tags, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  def admin_destroy_check
    throw(:abort) if User.where(admin: true).count == 1 && admin == true
  end

  def admin_update_exist
    throw(:abort) if User.where(admin: true).count == 1 && saved_change_to_admin == [true, false]
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'guest'
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = 'admin_guest'
      user.admin = true
    end
  end


  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end
end
