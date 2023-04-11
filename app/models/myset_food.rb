class MysetFood < ApplicationRecord
  belongs_to :mayset
  belongs_to :food
  belongs_to :custom_food
end
