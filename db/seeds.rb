  Admin.create!(
     email: 'a@a',
     password: '123456'
  )

  users_data = [
    ["ポチ", "a@a", "20", "男性"],
    ["ミケ", "s@s", "25", "女性"],
    ["dsfv", "a@asdf", "33", "男性"],
    ["クロ", "q@q", "35", "秘密"]
  ]

  users_attributes = users_data.map do |data|
    { nickname: data[0],
      email: data[1],
      password: "password",
      birthday: data[2],
      sex: data[3]}
  end

  users_attributes.each do |attr|
    User.create!(attr)
  end

genres = ["塩", "甘味", "酢", "醤油", "味噌", "ドレッシング", "ソース", "辛味", "スパイス"]

genres.each{ |genre| Genre.create!(name: genre) }
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
