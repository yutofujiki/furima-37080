FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    last_name_kanji       { '田中' }
    last_name_kana       { 'タナカ' }
    first_name_kanji      { '太郎' }
    first_name_kana      { 'タロウ' }
    email                 { Faker::Internet.free_email }
    password              { 'abc1234' }
    password_confirmation { password }
    birthday              { '2000-01-01' }
  end
end
