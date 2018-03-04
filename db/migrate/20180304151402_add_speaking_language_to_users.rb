class AddSpeakingLanguageToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :speaking_language, :string
  end
end
