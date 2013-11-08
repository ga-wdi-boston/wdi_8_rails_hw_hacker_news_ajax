class Post < ActiveRecord::Base
	has_many :comments
	has_many :votes, as: :votable
  belongs_to :user

  def total_votes
  	self.votes.where(up: true).count - self.votes.where(up: false).count
  end
end
