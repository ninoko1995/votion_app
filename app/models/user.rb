class User < ActiveRecord::Base
  has_many :investments,dependent: :destroy
  has_many :likes,dependent: :destroy
  validates :name,
            presence: true ,
            uniqueness: true, 
            length:{is: 8},
            numericality:{only_integer: true}
  has_many :candidates, through: :investments
end
