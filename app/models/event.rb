class Event < ActiveRecord::Base
  has_many :rsvps
  has_many :users, through: :rsvps
  belongs_to :restaurant

  validates :restaurant_id, numericality: {greater_than: 0}

  def location
    restaurant.title
  end
end
