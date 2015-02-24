class Movie < ActiveRecord::Base
  validates :title, :year, presence: true
  has_many :productions
  has_many :actos, through: :productions
end
