class User < ActiveRecord::Base
  acts_as_voter
  has_one :confirmation_code
  has_many :exercises
  attr_accessible :email, :first_name, :last_name, :provider, :uid
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth) 
  end

  private

  def self.create_from_omniauth(auth)
    @temp_code = SecureRandom.hex
    YourMailer.confirmation_email(auth["info"]["email"], @temp_code).deliver
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]
      user.confirmed = (auth["provider"] == "facebook") ? true : false
      user.build_confirmation_code(:code => @temp_code).save
    end
  end
end
