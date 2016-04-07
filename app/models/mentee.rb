class Mentee < ActiveRecord::Base
  has_many :mentorships
  has_many :mentors, through: :mentorships

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, pw)
    mentee = self.find_by(email: email)
    mentee.password == pw
  end

end
