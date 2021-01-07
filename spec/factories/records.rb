FactoryBot.define do
  factory :record do
    tr_theme                 {Faker::Name.initials(number: 2)}
    tr_content               {Faker::Alphanumeric.alphanumeric(number: 10)}
    category_id              {Faker::Number.between(from: 2, to: 11)}
    evaluation_id            {Faker::Number.between(from: 2, to: 7)}
    event                    {Faker::Number.between(from: 2, to: 3)}
    mvp                      {Faker::Name.initials(number: 2)}
    mvp_reason               {"頑張っていた"}
    tr_day                   {Faker::Date.birthday(min_age: 18, max_age: 65)}
     
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
