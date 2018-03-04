class AddMentorRecommandedListToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :mentor_recommanded_list, :string
  end
end
