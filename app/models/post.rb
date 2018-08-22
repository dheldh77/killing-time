class Post < ApplicationRecord
  
  validates :title, presence: true
  serialize :image, Array
  serialize :video, Array
  
  has_many :replies
  belongs_to :user
  
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  
  has_many :bookmarks
  has_many :bookmarked_users, through: :bookmarks, source: :user
  
  has_many :impressions, :as=>:impressionable

 def impression_count
     impressions.size
 end

 def unique_impression_count
     # impressions.group(:ip_address).size gives => {'127.0.0.1'=>9, '0.0.0.0'=>1}
     # so getting keys from the hash and calculating the number of keys
     impressions.group(:ip_address).size.keys.length #TESTED
 end
end
