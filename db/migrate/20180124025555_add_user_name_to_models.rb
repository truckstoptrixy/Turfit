class AddUserNameToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :user_name, :string

    add_index :models, :user_name, unique: true
  end
end
