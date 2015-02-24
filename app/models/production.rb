class Production < ActiveRecord::Base
  validates :actor_id, uniqueness: {scope: :movie_id}
  belongs_to :movie
  belongs_to :actor
end
