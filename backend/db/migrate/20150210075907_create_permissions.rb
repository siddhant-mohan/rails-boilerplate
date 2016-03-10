class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :title
      t.string :action
      t.string :subject

      t.timestamps null: false
    end
  end
end
