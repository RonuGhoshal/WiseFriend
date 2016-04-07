class CreateMentees < ActiveRecord::Migration
  def change
    create_table :mentees do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.integer :age
      t.string :gender
      t.string :mentor_preferred_gender
      t.string :email
      t.string :phone
      t.string :preferred_communication
      t.string :how_did_you_hear
      t.string :addl_info
      t.string :challenge1
      t.string :challenge2
      t.string :challenge3
    end
  end
end
