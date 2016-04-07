class Mentee < ActiveRecord::Base
  has_many :mentorships
  has_many :mentors, through: :mentorships
end
