class Myset < ApplicationRecord
  belongs_to :user
  has_many :myset_foods
  has_many :foods, through: :myset_foods
  has_one_attached :image
  accepts_nested_attributes_for :myset_foods, allow_destroy: true
end
