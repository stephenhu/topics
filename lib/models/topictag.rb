class TopicTag < ActiveRecord::Base
  belongs_to :topics
  belongs_to :tags
end
