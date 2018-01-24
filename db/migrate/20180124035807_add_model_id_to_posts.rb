class AddModelIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :model, foreign_key: true
  end
end
