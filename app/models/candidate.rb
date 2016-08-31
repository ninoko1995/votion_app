class Candidate < ActiveRecord::Base
  has_many :investments,dependent: :destroy
end
