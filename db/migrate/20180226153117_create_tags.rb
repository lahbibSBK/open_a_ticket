class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :mentor_profil, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
