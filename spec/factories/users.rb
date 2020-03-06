FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 6)
    nickname               {Faker::JapaneseMedia::DragonBall.character}
    email                  {Faker::Internet.email}
    password               {password}
    password_confirmation  {password}
    family_name            {Faker::Name.last_name}
    family_name_kana       {Faker::Name.last_name}
    birthday               {Faker::Date.birthday}
    avatar                 {"sample.png"}
    profile                {"こんにちは。私はイトウです"}
    phone_number           {Faker::PhoneNumber.cell_phone}
    sex                    {"0"}
  end
end
