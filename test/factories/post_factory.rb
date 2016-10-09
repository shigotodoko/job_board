FactoryGirl.define do
  factory :post do
    title 'Auto-peças'
    location 'Aichi-ken, Toyohashi-shi'
    description 'Vagas para homens, mulheres e casais'
    salary '1.000 ienes/hora'
    shift 'hirukin'
    day_off 'weekends'
    work_load '07:00 ~ 16:50'

    trait :with_contractor do
      association :contractor, factory: :contractor
    end

    trait :published do
      status :published
      published_at '10/02/2016'.to_d
    end

    trait :pending do
      status :pending
    end
  end
end
