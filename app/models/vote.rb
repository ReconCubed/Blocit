class Vote < ActiveRecord::Base
        validates :value, inclusion: { in: [-1, 1],
        message: "%{value} is not a valid value" }
end
