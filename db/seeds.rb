# Food.create!(
#   name: "ご飯",
#   calorie: 168,
#   protein: 2.5,
#   carbo: 37.1,
#   fat: 0.3,
#   salt: 0,
#   unit: "100g" 
# )
# Food.create!(
#   name: "牛もも肉",
#   calorie: 182,
#   protein: 21.2,
#   carbo: 0.5,
#   fat: 9.6,
#   salt: 0.1,
#   unit: "100g" 
# )
# Food.create!(
#   name: "醤油",
#   calorie: 13,
#   protein: 1.4,
#   carbo: 1.82,
#   fat: 0,
#   salt: 2.61,
#   unit: "大さじ1(18g)" 
# )
# Food.create!(
#   name: "マヨネーズ",
#   calorie: 84,
#   protein: 0.18,
#   carbo: 0.54,
#   fat: 9.04,
#   salt: 0.2,
#   unit: "大さじ1(12g)" 
# )
# Food.create!(
#   name: "納豆",
#   calorie: 100,
#   protein: 8.25,
#   carbo: 6.05,
#   fat: 5.0,
#   salt: 0,
#   unit: "1パック(50g)" 
# )
# Food.create!(
#   name: "LYFT WPIアロエヨーグルト",
#   calorie: 114,
#   protein: 25.2,
#   carbo: 2.6,
#   fat: 0.4,
#   salt: 0.05,
#   unit: "30g" 
# )
# Food.create!(
#   name: "アボカド",
#   calorie: 262,
#   protein: 3.5,
#   carbo: 8.68,
#   fat: 26.18,
#   salt: 0,
#   unit: "140g(1個可食部のみ)" 
# )
# Food.create!(
#   name: "牛カルビ",
#   calorie: 371,
#   protein: 14.4,
#   carbo: 0.2,
#   fat: 32.9,
#   salt: 0.1,
#   unit: "100g" 
# )
# Food.create!(
#   name: "生卵",
#   calorie: 91,
#   protein: 7.38,
#   carbo: 0.18,
#   fat: 6.18,
#   salt: 0.24,
#   unit: "1個(60g)" 
# )
5.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password",
    admin: false
  )
end

# UserPhysicalInformations
User.all.each do |user|
  UserPhysicalInformation.create!(
    name: "Info #{user.id}",
    metabolism: 1800,
    user_id: user.id,
    protein: 60,
    carbo: 250,
    fat: 50,
    salt: 6
  )
end


# CustomFoods
User.all.each do |user|
  5.times do |i|
    CustomFood.create!(
      name: "カスタム食品#{i + 1}",
      calorie: (i + 1) * 100,
      protein: (i + 1) * 2,
      carbo: (i + 1) * 20,
      fat: (i + 1) * 1,
      salt: (i + 1) * 0.2,
      unit: 'g',
      user_id: user.id
    )
  end
end

# Mysets
User.all.each do |user|
  5.times do |i|
    Myset.create!(
      name: "マイセット#{i + 1}",
      user_id: user.id
    )
  end
end

# MysetFoods
Myset.all.each do |myset|
  Food.all.each_with_index do |food, i|
    MysetFood.create!(
      myset_id: myset.id,
      food_id: food.id,
      custom_food_id: nil,
      amount: (i + 1) * 10
    )
  end
end

# DailyRecords
User.all.each do |user|
  5.times do |i|
    DailyRecord.create!(
      user_id: user.id,
      date: Date.today - i.days,
      comment: "日記#{i + 1}"
    )
  end
end

# DailyRecordItems
DailyRecord.all.each do |daily_record|
  5.times do |i|
    DailyRecordItem.create!(
      daily_record_id: daily_record.id,
      food_id: i + 1,
      myset_id: nil,
      custom_food_id: nil,
      amount: 100,
      meal_timing: i % 4
    )
  end
end