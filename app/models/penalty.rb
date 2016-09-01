class Penalty < ActiveRecord::Base
  belongs_to :rsvp
  has_one :user, through: :rsvp
  has_one :event, through: :rsvp

  validates :rsvp_id, numericality: {greater_than: 0}
  validates :kind, presence: true

  # DO NOT CHANGE THE ORDER OF THIS LIST. ONLY APPEND TO THE END.
  enum kind: [
    :attended_on_time,
    :attended_late,
    :late_rsvp,
    :last_minute_change,
    :did_not_attend,
  ]
end