class Topic < ActiveRecord::Base

  belongs_to :user

  has_and_belongs_to_many :tags, :join_table => "topictags"

  has_many :comments
  has_many :attachments

end
