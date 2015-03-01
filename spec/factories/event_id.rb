FactoryGirl.define do
  factory :event_id, class: String do
    skip_create
    initialize_with{'bdb6ec00-5284-11e4-8e22-6dacd62599e2'}
  end
end
