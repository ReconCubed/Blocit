require 'rails_helper'
 
describe User do
 
  include TestFactories
 
  describe "FactoryGirl" do
 
    it "return true for 1 post and 1 comment" do
    end
  end
  describe ".top_rated" do
    before do
      
      @user1 = create(:user_with_post_and_comment)
      
      @user2 = create(:user_with_post_and_comment)
      post = @user2.posts.last
      create(:comment, user: @user2, post: post)
    end
      it "returns users ordered by comments + posts" do
      expect( User.top_rated ).to eq([@user2, @user1])
    end
    it "stores a `post_count` on user" do
      users = User.top_rated
      expect( users.first.posts.count ).to eq(1)
    end
    it "stores a `comments_count` on user" do
      users = User.top_rated
      expect( users.first.comments.count ).to eq(2)
    end
  end
end
