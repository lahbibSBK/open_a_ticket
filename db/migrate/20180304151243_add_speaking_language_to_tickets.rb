class AddSpeakingLanguageToTickets < ActiveRecord::Migration[5.1]
  def change
    add_column :tickets, :speaking_language, :string
  end
end
