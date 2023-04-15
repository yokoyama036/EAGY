class DailyRecord < ApplicationRecord
  has_many :daily_record_items, dependent: :destroy
  has_many :foods, through: :daily_record_items
  accepts_nested_attributes_for :daily_record_items, allow_destroy: true
  has_many :custom_foods, through: :daily_record_items
  has_many :mysets, through: :daily_record_items
  belongs_to :user

  # enum meal_timing: { 朝食: 0, 昼食: 1, 夕食: 2, 間食: 3 }
  # validates :quantity, numericality: { greater_than: 0 }
  scope :by_date, ->(date) { where(created_at: date.all_day) }

  def start_time
    self.date # 日常記録の日付を表すカラム
  end

  def consumed_calories
    daily_records_on_same_date = DailyRecord.where(date: self.date)
    daily_record_items_on_same_date = DailyRecordItem.where(daily_record_id: daily_records_on_same_date.ids)
    daily_record_items_on_same_date.inject(0) do |sum, item|
      amount = item.amount || 0
      if item.food.present?
        sum + item.food.calorie * amount / 100
      elsif item.myset.present?
        sum + item.myset.total_calorie(amount)
      else
        sum
      end
    end
  end

  def calorie_percentage(user_physical_information)
    return 0 if user_physical_information.metabolism == 0
    (consumed_calories / user_physical_information.metabolism) * 100
  end

  def consumed_protein
    daily_records_on_same_date = DailyRecord.where(date: self.date)
    daily_record_items_on_same_date = DailyRecordItem.where(daily_record_id: daily_records_on_same_date.ids)

    daily_record_items_on_same_date.inject(0) do |sum, item|
      amount = item.amount || 0
      if item.food.present?
        sum + item.food.protein * amount / 100
      elsif item.myset.present?
        sum + item.myset.total_protein(amount)
      else
        sum
      end
    end
  end
  def consumed_carbo
    daily_records_on_same_date = DailyRecord.where(date: self.date)
    daily_record_items_on_same_date = DailyRecordItem.where(daily_record_id: daily_records_on_same_date.ids)

    daily_record_items_on_same_date.inject(0) do |sum, item|
      amount = item.amount || 0
      if item.food.present?
        sum + item.food.carbo * amount / 100
      elsif item.myset.present?
        sum + item.myset.total_carbo(amount)
      else
        sum
      end
    end
  end
  def consumed_fat
    daily_records_on_same_date = DailyRecord.where(date: self.date)
    daily_record_items_on_same_date = DailyRecordItem.where(daily_record_id: daily_records_on_same_date.ids)

    daily_record_items_on_same_date.inject(0) do |sum, item|
      amount = item.amount || 0
      if item.food.present?
        sum + item.food.fat * amount / 100
      elsif item.myset.present?
        sum + item.myset.total_fat(amount)
      else
        sum
      end
    end
  end
  def consumed_salt
    daily_records_on_same_date = DailyRecord.where(date: self.date)
    daily_record_items_on_same_date = DailyRecordItem.where(daily_record_id: daily_records_on_same_date.ids)

    daily_record_items_on_same_date.inject(0) do |sum, item|
      amount = item.amount || 0
      if item.food.present?
        sum + item.food.salt * amount / 100
      elsif item.myset.present?
        sum + item.myset.total_salt(amount)
      else
        sum
      end
    end
  end

end
