class AddBioToModels < ActiveRecord::Migration[5.1]
  def change
    add_column :models, :bio, :text
  end
end
