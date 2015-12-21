module TestFactories
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
end