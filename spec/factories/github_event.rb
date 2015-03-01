FactoryGirl.define do
  factory :github_event do
    event
    event_id
    payload

    skip_create
    initialize_with{new(event, event_id, payload)}
  end
end
