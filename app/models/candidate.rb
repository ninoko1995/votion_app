class Candidate < ActiveRecord::Base
  has_many :investments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :users, through: :investments
end
