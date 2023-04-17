class User < ApplicationRecord
  has_many :daily_records, dependent: :destroy
  has_many :custom_foods, dependent: :destroy
  has_many :mysets, dependent: :destroy
  has_one :user_physical_information
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest  
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
  end

  def self.guest_admin
    find_or_create_by!(email: 'guest_admin@example.com') do |user|
      user.password = user.password_confirmation = SecureRandom.urlsafe_base64
      user.admin = true
    end
  end

end
