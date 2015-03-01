FactoryGirl.define do
  factory :event, aliases: ['pull_request_event'], class: String do
    skip_create
    initialize_with{'pull_request'}

    factory :ping_event do
      initialize_with{'ping'}
    end
  end
end
