class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :tags
  has_many :comments
  has_many :attachments
end
