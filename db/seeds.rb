# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Food.create!(
  id:2,
  name: "オートミール",
  calorie: 380,
  protein: 13.7,
  carbo: 69.1,
  fat: 5.7,
  salt: 0,
  unit: "100g" 
)
Food.create!(
  id:3,
  name: "調整豆乳",
  calorie: 64,
  protein: 3.2,
  carbo: 4.8,
  fat: 3.6,
  salt: 0.1,
  unit: "100g" 
)
Food.create!(
  id:4,
  name: "バナナ",
  calorie: 86,
  protein: 1.1,
  carbo: 22.5,
  fat: 0.2,
  salt: 0,
  unit: "100g" 
)
Food.create!(
  id:5,
  name: "はちみつ",
  calorie: 62,
  protein: 0.04,
  carbo: 16.74,
  fat: 0,
  salt: 0,
  unit: "大さじ1(21g)" 
)
Food.create!(
  id:6,
  name: "ココア",
  calorie: 16,
  protein: 1.11,
  carbo: 2.54,
  fat: 1.3,
  salt: 0,
  unit: "大さじ1(6g)" 
)