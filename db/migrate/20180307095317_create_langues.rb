class CreateLangues < ActiveRecord::Migration[5.1]
  def change
    create_table :langues do |t|

      t.timestamps
    end
  end
end
