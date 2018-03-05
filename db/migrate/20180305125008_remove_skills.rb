class RemoveSkills < ActiveRecord::Migration[5.1]
  def change
    drop_table :skills
  end
end
