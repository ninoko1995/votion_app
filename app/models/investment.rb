class Investment < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :user
  validates :user_id, presence: true
  validates :candidate_id, presence:true
  validates :money, presence: true
end
