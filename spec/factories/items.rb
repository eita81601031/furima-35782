FactoryBot.define do

  factory :item do
    product_name              {"ズボン"}
    description               {"ビンテージ"}
    category_id               {"2"}
    status_id                 {"2"}
    shipping_cost_id          {"3"}
    prefecture_id             {"3"}
    shipping_id               {"3"}
    price                     {"1000"}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
 end

