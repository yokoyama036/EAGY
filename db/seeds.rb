# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.create!(
  id:13,
  name: "ご飯",
  calorie: 168,
  protein: 2.5,
  carbo: 37.1,
  fat: 0.3,
  salt: 0,
  unit: "100g" 
)
Food.create!(
  id:8,
  name: "牛もも肉",
  calorie: 182,
  protein: 21.2,
  carbo: 0.5,
  fat: 9.6,
  salt: 0.1,
  unit: "100g" 
)
Food.create!(
  id:9,
  name: "醤油",
  calorie: 13,
  protein: 1.4,
  carbo: 1.82,
  fat: 0,
  salt: 2.61,
  unit: "大さじ1(18g)" 
)
Food.create!(
  id:10,
  name: "マヨネーズ",
  calorie: 84,
  protein: 0.18,
  carbo: 0.54,
  fat: 9.04,
  salt: 0.2,
  unit: "大さじ1(12g)" 
)
Food.create!(
  id:11,
  name: "納豆",
  calorie: 100,
  protein: 8.25,
  carbo: 6.05,
  fat: 5.0,
  salt: 0,
  unit: "1パック(50g)" 
)
Food.create!(
  id:12,
  name: "LYFT WPIアロエヨーグルト",
  calorie: 114,
  protein: 25.2,
  carbo: 2.6,
  fat: 0.4,
  salt: 0.05,
  unit: "30g" 
)
Food.create!(
  id:13,
  name: "アボカド",
  calorie: 262,
  protein: 3.5,
  carbo: 8.68,
  fat: 26.18,
  salt: 0,
  unit: "140g(1個可食部のみ)" 
)
Food.create!(
  id:14,
  name: "牛カルビ",
  calorie: 371,
  protein: 14.4,
  carbo: 0.2,
  fat: 32.9,
  salt: 0.1,
  unit: "100g" 
)