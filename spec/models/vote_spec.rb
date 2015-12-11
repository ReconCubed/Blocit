require 'rails_helper'

describe Vote do
  def authenticated_user(options={})
    user_options = {email: "email#{rand}@dc.com", password: 'password'}.merge(options)
    user = User.new(user_options)
    user.skip_confirmation!
    user.save
    user
  end
  def associated_post(options={})
    post_options = {
      title: 'post title',
      body: 'post bodies have to be atleast 50 chars',
      topic: Topic.create(name: 'Topic name'),
      user: authenticated_user
        
    }.merge(options)
    Post.create(post_options)
  end
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
  describe 'after_save' do
    it "calls 'Post#update_rank' after save" do
      post= associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end