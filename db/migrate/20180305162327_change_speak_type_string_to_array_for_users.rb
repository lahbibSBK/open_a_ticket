class ChangeSpeakTypeStringToArrayForUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :speaking_language
  	add_column :users, :speaking_language, :string, array: true
  end
end
