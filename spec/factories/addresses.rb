FactoryBot.define do
  factory :address do
    last_name               {"安倍"}
    first_name              {"晋三"}
    last_name_kana          {"アベ"}
    first_name_kana         {"シンゾウ"}
    phone_number            {"012-3456-7890"}
    post_code               {"012-3456"}
    prefecture              {"東京都"}
    city                    {"新宿区西"}
    block                   {"新宿"}
    building                {"2丁目8−1 東京都庁"}
    user_id                 {1}
  end
end
