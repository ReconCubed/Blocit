require 'rails_helper'
require 'capybara/rails'
describe "Visiting profiles" do
    
    include TestFactories
    
    before do
        @user = authenticated_user
        @post = associated_post(user: @user)
        @comment = Comment.new(user: @user, post: @post, body: "A Comment")
        allow(@comment).to receive(:send_favorite_emails)
        @comment.save!
    end
    
    describe "Not signed in" do
        it "shows profile" do
            visit user_path(@user)
            expect(current_path).to eq(user_path(@user))
            expect( page ).to have_content(@user.name)
            expect( page ).to have_content(@post.title)
            expect( page ).to have_content(@comment.body)
        end
    end
    describe "View own their own profile" do
    
    before do
        @user = authenticated_user
        login_as(@user, :scope => :user)
    end
    
    it "shows users own profile" do
        visit user_path(@user)
        expect(current_path).to eq(user_path(@user))
        expect( page ).to have_content(@user.name)
    end
end
end
