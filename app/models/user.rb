class User < ApplicationRecord
  has_many :daily_records, dependent: :destroy
  has_many :custom_foods, dependent: :destroy
  has_many :mysets, dependent: :destroy
  has_one :user_physical_information
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
