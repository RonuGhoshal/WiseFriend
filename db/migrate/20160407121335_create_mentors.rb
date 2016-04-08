class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.integer :age
      t.string :gender
      t.string :mentee_preferred_gender
      t.string :email
      t.string :phone
      t.string :linkedin
      t.string :preferred_communication
      t.string :how_did_you_hear
      t.string :addl_info
      t.string :password_hash
    end
  end
end
