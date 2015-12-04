class Vote < ActiveRecord::Base
        validates :value, inclusion: { in: [-1, 1],
        message: "%{value} is not a valid value" }
        after_save :update_post
        
        private
        def update_post
                post.update_rank
        end
        def up_vote?
                value == 1
        end
 
        def down_vote?
                value == -1
        end
end
