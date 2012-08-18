require "digest/md5"
require "securerandom"

class User < ActiveRecord::Base

  has_many :topics

  validates_uniqueness_of :email

  before_create :set_salt
  before_create :set_uuid

  def set_salt
    self.salt = SecureRandom.hex(16)
  end

  def set_uuid
    self.uuid = Digest::MD5.hexdigest(email + salt)
  end

  def canonical_name
    return email.split('@')[0]
  end

end

