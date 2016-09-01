class Rsvp < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :penalties

  validates :user_id, numericality: {greater_than: 0}
  validates :event_id, numericality: {greater_than: 0}
  validates :rsvp, presence: true

  # DO NOT CHANGE THE ORDER OF THIS LIST. ONLY APPEND TO THE END.
  enum rsvp: [
    :yes,
    :no,
    :maybe,
  ]
end
