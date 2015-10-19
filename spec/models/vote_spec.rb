require 'rails_helper'

describe Vote do
  before do
    @user = User.new(email: 'test@user.me', password: 'testuser')
    @user.skip_confirmation!
    @user.save
    @topic = Topic.create(name:'RSPec', public: false)
    @post = @topic.posts.create(title: 'blasdaa', body: 'blablsbjgjgfjghfjfjfjjhjfjjhjhffskfhsdfjhsdfjhskfjskjsdfkjsfk', user: @user)
    @vote = @user.votes.build(post_id: @post.id)
  end
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        @vote.value = 1
        expect(@vote).to be_valid
        @vote.value = -1
        expect(@vote).to be_valid
      end
      it "doesn't allow 0 or -25 as values" do
        [0, 2, -2, 5, -5, 25, -25].each do |num|
          @vote.value = num
          expect(@vote).not_to be_valid
        end
      end
    end
  end
end