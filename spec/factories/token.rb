FactoryGirl.define do
  factory :token, class: String do
    skip_create
    initialize_with{'5257771f207094a0a9a5babc94a5f6d2d3dfe619bf8199fdb9af8dc868eb2048'}
  end
end
