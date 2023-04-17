class MysetFood < ApplicationRecord
  belongs_to :myset
  belongs_to :food, optional: true
  belongs_to :custom_food, optional: true
 
end
