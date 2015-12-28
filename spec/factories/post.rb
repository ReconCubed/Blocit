FactoryGirl.define do
    factory :post do
        title "Post title"
        body "Boodie text hqs to be really long."
        user
        topic { Topic.create(name: 'Topic name') }
    end
end