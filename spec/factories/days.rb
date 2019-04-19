FactoryBot.define do
  factory :day do
    sequence(:order) { |n| n%7 }

    factory :monday do
      order {0}
    end
    factory :tuesday do
      order {1}
    end
    factory :wednesday do
      order {2}
    end
    factory :thursday do
      order {3}
    end
    factory :friday do
      order {4}
    end
    factory :saturday do
      order {5}
    end
    factory :sunday do
      order {6}
    end
  end
end
