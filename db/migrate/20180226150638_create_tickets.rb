class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :content
      t.string :price
      t.string :ticket_skills
      t.string :ticket_duration
      t.string :ticket_location
      t.string :priority
      t.string :status
      t.integer :alumni_id, foreign_key: true, index: true
      t.integer :mentor_id, foreign_key: true, index: true

      t.timestamps
    end
  end
end
