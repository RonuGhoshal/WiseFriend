class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :area_type
      t.integer :mentor_id
    end
  end
end
