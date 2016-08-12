class Rsvp < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
	belongs_to :penalty

	# DO NOT CHANGE THE ORDER OF THIS LIST. ONLY APPEND TO THE END.
	enum rsvp: [
		:yes,
		:no,
		:maybe,
	]
end
