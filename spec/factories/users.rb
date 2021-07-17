FactoryBot.define do
  factory :user do
    name              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    kanji_first_name {"田中"}
    kanji_last_name {"太郎"}
    katakana_first_name {"タナカ"}
    katakana_last_name {"タロウ"}
    birthday {"1943-10-14"}
  end
end