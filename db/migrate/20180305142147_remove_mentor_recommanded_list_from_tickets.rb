class RemoveMentorRecommandedListFromTickets < ActiveRecord::Migration[5.1]
  def change
    remove_column :tickets, :mentor_recommanded_list
  end
end
