class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :rsvps
  has_many :events, through: :rsvps
  has_many :penalties, through: :rsvps

  before_save :set_email_not_nil
  before_save :fill_username

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = auth.info.email || ""
      user.password = Devise.friendly_token[0,20]
      user.username = auth.info.name
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      [:facebook].each do |provider|
        if data = session["devise.#{provider}_data"] && session["devise.#{provider}_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end

  def total_penalties
    penalties.count
  end

  def rsvp_for(event)
    rsvps.find_by_event_id(event.id).try(:rsvp)
  end

  def admin?
    id == 1
  end


  private

  def set_email_not_nil
    self.email ||= ""
  end

  def fill_username
    self.username ||= self.email
  end

  def email_required?
    provider.blank?
  end
end
