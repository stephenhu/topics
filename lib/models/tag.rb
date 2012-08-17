class Tag < ActiveRecord::Base

  has_and_belongs_to_many :topics, :join_table => "topictags"

  validates_uniqueness_of :tag

end
