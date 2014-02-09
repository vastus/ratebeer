FactoryGirl.define do
  factory :user do
    username "Testos"
    password "Secret0s"
    password_confirmation "Secret0s"
  end

  factory :rating do
    score 10
  end

  factory :another_rating, class: Rating do
    score 20
  end

  factory :brewery do
    name "anonymous"
    year 1900
  end

  factory :beer do
    name "anonymous"
    style "Lager"
    brewery
  end
end

