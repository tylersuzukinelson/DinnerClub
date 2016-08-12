class Penalty < ActiveRecord::Base
	has_many :rsvps
	has_many :users, through: :rsvps

	# DO NOT CHANGE THE ORDER OF THIS LIST. ONLY APPEND TO THE END.
	enum kind: [
		:attended_on_time,
		:attended_late,
		:late_rsvp,
		:last_minute_change,
		:did_not_attend,
	]
end