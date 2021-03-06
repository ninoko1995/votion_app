class User < ActiveRecord::Base
  has_many :investments,dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :candidates, through: :investments
  validates :name,
            presence: true ,
            uniqueness: true, 
            numericality:{only_integer: true},
            length:{is: 8}
end
