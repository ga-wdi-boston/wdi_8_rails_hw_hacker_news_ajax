class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable

  def total_votes
  	self.votes.where(up: true).count - self.votes.where(up: false).count
  end
end
