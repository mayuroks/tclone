class Tweet < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :body
  has_and_belongs_to_many :hashtags
  validates_length_of :body, :within => 1..140
end
