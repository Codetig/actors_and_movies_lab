class Actor < ActiveRecord::Base
  validates :name, presence: true
  has_many :productions
  has_many :movies, through: :productions
end
