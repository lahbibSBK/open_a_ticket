class ChangeSpeakTypeStringToArrayForTickets < ActiveRecord::Migration[5.1]
  def change
  	remove_column :tickets, :speaking_language
  	add_column :tickets, :speaking_language, :string, array: true
  end
end
