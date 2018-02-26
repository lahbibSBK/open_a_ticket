class CreateMentorProfils < ActiveRecord::Migration[5.1]
  def change
    create_table :mentor_profils do |t|
      t.text :experience
      t.integer :minimum_price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
