class AddMentorSkillsToMentorProfils < ActiveRecord::Migration[5.1]
  def change
    add_column :mentor_profils, :mentor_skills, :string
  end
end
