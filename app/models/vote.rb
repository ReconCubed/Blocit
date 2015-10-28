class Vote < ActiveRecord::Base
        validates :value, inclusion: { in: [-1, 1],
        message: "%{value} is not a valid value" }
        after_sabe :update_post
        
        private
        def update_post
                post.update_rank
        
end
