FactoryBot.define do
  factory :user do
    nickname              {"sample999"}
    email                 {"sample999@sample.com"}
    password              {"a12345"}
    password_confirmation {"a12345"}
    last_name           {"佐藤"}
    first_name            {"太郎"}
    last_name_kana      {"サトウ"}
    first_name_kana       {"タロウ"}
    birthday             {"2021-02-02"}
  end
end