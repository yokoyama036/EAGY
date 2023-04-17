class UserPhysicalInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :metabolism, presence: { message: '必要エネルギー量が計算されていません。' }, numericality: true

end
