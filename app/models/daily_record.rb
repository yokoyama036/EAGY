class DailyRecord < ApplicationRecord
  has_many :daily_record_items, dependent: :destroy
  has_many :foods, through: :daily_record_items
  accepts_nested_attributes_for :daily_record_items, allow_destroy: true
  has_many :custom_foods, through: :daily_record_items
  has_many :mysets, through: :daily_record_items
  belongs_to :user

  scope :by_date, ->(date) { where(created_at: date.all_day) }

  def consumed_calories
    daily_records_on_same_date = DailyRecord.where(date: self.date)
    daily_record_items_on_same_date = DailyRecordItem.where(daily_record_id: daily_records_on_same_date.ids)
    daily_record_items_on_same_date.inject(0) do |sum, item|
      amount = item.amount || 0
      if item.food.present?
        sum + item.food.calorie * amount / 100
      elsif item.myset.present?
        sum + item.myset.total_calorie(amount)
      elsif item.custom_food.present?
        sum + item.custom_food.calorie * amount / 100
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
      elsif item.custom_food.present?
        sum + item.custom_food.protein * amount / 100
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
      elsif item.custom_food.present?
        sum + item.custom_food.carbo * amount / 100
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
      elsif item.custom_food.present?
        sum + item.custom_food.fat * amount / 100
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
      elsif item.custom_food.present?
        sum + item.custom_food.salt * amount / 100
      else
        sum
      end
    end
  end

end
