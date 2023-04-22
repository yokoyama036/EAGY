class UserPhysicalInformation < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :metabolism, presence: { message: '必要エネルギー量が計算されていません。' }, numericality: true

  attr_accessor :height, :weight, :age, :activity_level

  # バリデーションを追加
  validates :height, presence: true
  validates :weight, presence: true
  validates :age, presence: true
  validates :activity_level, presence: true
end
