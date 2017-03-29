FactoryGirl.define do
  factory :property do
    sequence(:description) { |n| "Property#{n}" }
    sequence(:key_features) { |n| "Key Features for property#{n}" }
    user_id '1'
  end
end
