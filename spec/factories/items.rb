FactoryBot.define do
  factory :item do
    title               {"ヴィトンのシャツ"}
    text                {"10万円ほどで購入しました。飽きたので売ります。"}
    brand_id            {1}
    status              {3}
    delivery_charge_id  {2}
    delivery_origin_id  {3}
    delivery_size       {2}
    delivery_method_id  {1}
    delivery_days       {2}
    price               {100000}                  
  end
end
