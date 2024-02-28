class AddUserIdToAims < ActiveRecord::Migration[7.0]
  def up
    execute 'DELETE FROM aims;'
    add_reference :aims, :user, null: false, index: true
  end

  def down
    remove_reference :aims, :user, index: true
  end
end
