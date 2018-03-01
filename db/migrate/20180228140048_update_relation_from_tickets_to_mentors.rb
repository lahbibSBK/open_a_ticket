class UpdateRelationFromTicketsToMentors < ActiveRecord::Migration[5.1]
  def change
    remove_reference :tickets, :mentor
    add_reference :tickets, :mentor_profil, foreign_key: true
  end
end
