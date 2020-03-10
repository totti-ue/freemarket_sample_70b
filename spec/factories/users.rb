FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    nickname                {Faker::JapaneseMedia::DragonBall.character}
    email                   {Faker::Internet.email}
    password                {password}
    password_confirmation   {password}
    last_name               {"安倍"}
    first_name              {"晋三"}
    last_name_kana          {"アベ"}
    first_name_kana         {"シンゾウ"}
    birthday                {Faker::Date.birthday}
    avatar                  {"sample.png"}
    profile                 {"こんにちは。私は安倍晋三です"}
    sex                     {"0"}
  end
end
