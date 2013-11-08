class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true
  before_save :check_if_already_voted

  private
  def check_if_already_voted
  end
end
