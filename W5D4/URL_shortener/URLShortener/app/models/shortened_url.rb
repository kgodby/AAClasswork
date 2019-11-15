# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_shortened_urls_on_short_url  (short_url) UNIQUE
#
require 'securerandom'
class ShortenedUrl < ApplicationRecord
include SecureRandom
  validates :long_url, :short_url, null: false, uniqueness: true 
  validates :user_id, null: false
  
  def self.random_code
    
    random = SecureRandom.urlsafe_base64
    kif short_url.exists?()
    
    
  end
end
