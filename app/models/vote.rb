class Vote < ActiveRecord::Base
  validates :value, inclusion: { in: [-1, 1],
    message: "%{value} is not a valid value" }

  after_save :update_post
  belongs_to :post
  belongs_to :user
  
  def up_vote?
    value == 1
  end

  def down_vote?
    value == -1
  end

  private
  def update_post
    post.update_rank
  end


end
