FactoryGirl.define do
  factory :raw_payload, aliases: [:raw_pull_request_reopened_payload], class: String do
    fixture 'pull_request_reopened'

    skip_create
    initialize_with do
      path = File.expand_path('../../fixtures', __FILE__)
      File.read(File.join(path, "#{fixture}.json"))
    end

    factory :raw_ping_payload do
      fixture 'ping'
    end
  end

  factory :form_payload, aliases: [:form_pull_request_reopened_payload], class: String do
    raw_payload 'pull_request_reopened'

    skip_create
    initialize_with do
      URI.encode_www_form('payload' => build(:"raw_#{raw_payload}_payload"))
    end

    factory :form_ping_payload do
      raw_payload 'ping'
    end
  end

  factory :payload, aliases: [:pull_request_reopened_payload], class: Hash do
    raw_payload 'pull_request_reopened'

    skip_create
    initialize_with do
      JSON.parse(build(:"raw_#{raw_payload}_payload"))
    end

    factory :ping_payload do
      raw_payload 'ping'
    end
  end
end
