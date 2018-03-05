class RemoveTicketSkillsFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :ticket_skills
  end
end
