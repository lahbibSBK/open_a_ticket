class RemoveMentorSkillsFromMentorProfils < ActiveRecord::Migration[5.1]
  def change
    remove_column :mentor_profils, :mentor_skills
  end
end
