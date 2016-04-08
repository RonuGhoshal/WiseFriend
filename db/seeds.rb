areas = ['A', 'D', 'ED', 'EM', 'F', 'MC', 'MH', 'N']

      20.times do Mentor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: Faker::Address.city, age:rand(18..80), gender:["M", "F", "O"].sample, mentee_preferred_gender: ["M", "F", "O"].sample, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, preferred_communication: ["E", "P", "W"].sample, how_did_you_hear: ["I", "F", "N"].sample, addl_info: Faker::Hipster.paragraph, password: Faker::Internet.password)
      end

      20.times do Mentee.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: Faker::Address.city, age:rand(18..80), gender:["M", "F", "O"].sample, mentor_preferred_gender: ["M", "F", "O"].sample, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number, preferred_communication: ["E", "P", "W"].sample, how_did_you_hear: ["I", "F", "N"].sample, addl_info: Faker::Hipster.paragraph, password: Faker::Internet.password, challenge1: areas.sample, challenge2: areas.sample, challenge3: areas.sample)
      end



    60.times do Area.create(area_type: areas.sample, mentor_id: rand(1..20))
end
