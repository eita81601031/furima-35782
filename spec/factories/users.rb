FactoryBot.define do
  factory :user do
    nickname              {"asd"}
    email                 {"kkk@kkk.com"}
    password              {"000000"}
    password_confirmation {"000000"}
    first_name            {"太郎"}
    family_name             {"山田"}
    first_name_kana       {"タロウ"}
    family_name_kana        {"ヤマダ"}
    birth_day              {"2000/01/01"}
  end
end