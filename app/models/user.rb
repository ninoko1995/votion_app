class User < ActiveRecord::Base
  has_many :investment,dependent: :destroy
  validates :name, presence: true ,uniqueness: true, length:{is: 8}
end
