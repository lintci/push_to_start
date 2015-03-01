FactoryGirl.define do
  factory :signature, aliases: [:pull_request_reopened_signature], class: String do
    skip_create
    initialize_with{'sha1=2cae126948b24c8010b13e7e07be9f3d23cfb0b0'}

    factory :ping_signature do
      initialize_with{'sha1=33018662e77cc3c938f1dd6539a95b9e5564298b'}
    end
  end
end
