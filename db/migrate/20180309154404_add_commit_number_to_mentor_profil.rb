class AddCommitNumberToMentorProfil < ActiveRecord::Migration[5.1]
  def change
    add_column :mentor_profils, :commit_number, :integer
  end
end
